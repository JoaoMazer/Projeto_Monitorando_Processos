// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/anotacao_controller.dart';
import '../model/anotacao.dart';

class AnotacoesView extends StatefulWidget {
  const AnotacoesView({super.key});

  @override
  State<AnotacoesView> createState() => _AnotacoesViewState();
}

class _AnotacoesViewState extends State<AnotacoesView> {
  var txtProtocolo = TextEditingController();
  var txtAnotacao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(child: Text('Anotações')),
            
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 12),
              ),
              onPressed: () {
                LoginController().logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: Icon(Icons.exit_to_app, size: 30),
              label: Text('Sair'),
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarAnotacao(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarAnotacao(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text("Adicionar Anotação"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtProtocolo,
                  decoration: InputDecoration(
                    labelText: 'Protocolo do processo',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtAnotacao,
                  maxLines: 5,
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
                txtProtocolo.clear();
                txtAnotacao.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Incluir anotação"),
              onPressed: () {
                var a = Anotacao(
                  LoginController().idUsuario(),
                  txtProtocolo.text,
                  txtAnotacao.text,
                );
                txtProtocolo.clear();
                txtAnotacao.clear();
                if (docId == null) {
                  //
                  // ADICIONAR TAREFA
                  //
                  AnotacaoController().adicionar(context, a);
                } else {
                  //
                  // ATUALIZAR TAREFA
                  //
                  AnotacaoController().atualizar(context, docId, a);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
