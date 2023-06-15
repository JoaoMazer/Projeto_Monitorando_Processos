import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/anotacao.dart';
import '../view/util.dart';

class AnotacaoController {
  void adicionar(context, Anotacao a) {
    FirebaseFirestore.instance
        .collection('anotacoes')
        .add(a.toJson())
        .then((value) => sucesso(context, 'Anotação adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Anotacao a) {}
}
