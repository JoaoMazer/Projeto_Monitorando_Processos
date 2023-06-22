// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/enviado_controller.dart';
import '../model/enviado.dart';

class EnviadoView extends StatefulWidget {
  const EnviadoView({super.key});

  @override
  State<EnviadoView> createState() => _EnviadoViewState();
}

class _EnviadoViewState extends State<EnviadoView> {
  var txtProtocoloEnviado = TextEditingController();
  var txtDataEnviado = TextEditingController();
  //var txtDataEnviado = DateTime.now();
  var txtAnotacaoEnviado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(250, 26, 35, 126),
        title: Row(
          children: [
            Expanded(child: Text('Enviar processos')),
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 40),
                      label: Text(snapshot.data.toString()),
                    ),
                  );
                }
                return Text('');
              },
            ),
          ],
        ),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: EnviadoController().listar().snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic item = dados.docs[index].data();
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.barcode_reader),
                          title: Text(item['protocoloEnviado']),
                          subtitle: Text(item['dataEnviado']),
                          onTap: () {
                            txtProtocoloEnviado.text = item['protocoloEnviado'];
                            txtDataEnviado.text =item['dataEnviado'];
                            txtAnotacaoEnviado.text = item['anotacaoEnviado'];
                            salvarEnviado(context, docId: id);
                          },
                          onLongPress: () {
                            EnviadoController().excluir(context, id);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhum processo encontrado.'),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Color.fromARGB(250, 26, 35, 126),
        onPressed: () {
          salvarEnviado(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR PROCESSO
  //
  void salvarEnviado(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text("Enviar Processo"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtProtocoloEnviado,
                  decoration: InputDecoration(
                    labelText: 'Protocolo do processo',
                    prefixIcon: Icon(Icons.barcode_reader),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtDataEnviado,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Data',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                controller: txtAnotacaoEnviado,
                 maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Anotação',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                 ),
              ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtProtocoloEnviado.clear();
                txtDataEnviado.clear();
                txtAnotacaoEnviado.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              
              child: Text("Enviar Processo"),
              onPressed: () {                
                var e = Enviado(
                  LoginController().idUsuario(),
                  txtProtocoloEnviado.text,
                  txtDataEnviado.text,
                  txtAnotacaoEnviado.text,
                );
                txtProtocoloEnviado.clear();
                txtDataEnviado.clear();
                txtAnotacaoEnviado.clear();
                if (docId == null) {
                  //
                  // ADICIONAR ENVIADO
                  //
                  EnviadoController().adicionar(context, e);
                } else {
                  //
                  // ATUALIZAR ENVIADO
                  //
                  EnviadoController().atualizar(context, docId, e);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
