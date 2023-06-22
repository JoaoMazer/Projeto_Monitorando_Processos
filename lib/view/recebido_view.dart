// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/recebido_controller.dart';
import '../model/recebido.dart';

class RecebidoView extends StatefulWidget {
  const RecebidoView({super.key});

  @override
  State<RecebidoView> createState() => _RecebidoViewState();
}

class _RecebidoViewState extends State<RecebidoView> {
  var txtProtocoloRecebido = TextEditingController();
  var txtDataRecebido = TextEditingController();
  //var txtData = DateTime.now();
  var txtAnotacaoRecebido = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(250, 26, 35, 126),
        title: Row(
          children: [
            Expanded(child: Text('Receber processos')),
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
          stream: RecebidoController().listar().snapshots(),
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
                          title: Text(item['protocoloRecebido']),
                          subtitle: Text(item['dataRecebido']),
                          onTap: () {
                            txtProtocoloRecebido.text = item['protocoloRecebido'];
                            txtDataRecebido.text = item['dataRecebido'];
                            txtAnotacaoRecebido.text = item['anotacaoRecebido'];
                            salvarRecebido(context, docId: id);
                          },
                          onLongPress: () {
                            RecebidoController().excluir(context, id);
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
          salvarRecebido(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR PROCESSO
  //
  void salvarRecebido(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text("Receber Processo"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtProtocoloRecebido,
                  decoration: InputDecoration(
                    labelText: 'Protocolo do processo',
                    prefixIcon: Icon(Icons.barcode_reader),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtDataRecebido,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Data',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                controller: txtAnotacaoRecebido,
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
                txtProtocoloRecebido.clear();
                txtDataRecebido.clear();
                txtAnotacaoRecebido.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Receber Processo"),
              onPressed: () {
                var r = Recebido(
                  LoginController().idUsuario(),
                  txtProtocoloRecebido.text,
                  txtDataRecebido.text,
                  txtAnotacaoRecebido.text,
                );
                txtProtocoloRecebido.clear();
                txtDataRecebido.clear();
                txtAnotacaoRecebido.clear();
                if (docId == null) {
                  //
                  // ADICIONAR RECEBIDO
                  //
                  RecebidoController().adicionar(context, r);
                } else {
                  //
                  // ATUALIZAR RECEBIDO
                  //
                  RecebidoController().atualizar(context, docId, r);
                }
              },
            ),
          ],
        );
      },
    );
  }
}