import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/enviado.dart';
import '../view/util.dart';
import 'login_controller.dart';

class EnviadoController {
  void adicionar(context, Enviado e) {
    FirebaseFirestore.instance
        .collection('enviado')
        .add(e.toJson())
        .then((value) => sucesso(context, 'Processo incluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Enviado e) {
    FirebaseFirestore.instance
        .collection('enviado')
        .doc(id)
        .update(e.toJson())
        .then((value) => sucesso(context, 'Tarefa atualizada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('enviado')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Processo excluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }
  listar() {
    return FirebaseFirestore.instance
        .collection('enviado')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}
