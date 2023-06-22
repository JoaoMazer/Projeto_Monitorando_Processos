import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/recebido.dart';
import '../view/util.dart';
import 'login_controller.dart';

class RecebidoController {
  void adicionar(context, Recebido r) {
    FirebaseFirestore.instance
        .collection('recebido')
        .add(r.toJson())
        .then((value) => sucesso(context, 'Processo incluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Recebido r) {
    FirebaseFirestore.instance
        .collection('recebido')
        .doc(id)
        .update(r.toJson())
        .then((value) => sucesso(context, 'Processo atualizado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('recebido')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Procoesso excluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }
  listar() {
    return FirebaseFirestore.instance
        .collection('recebido')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}
