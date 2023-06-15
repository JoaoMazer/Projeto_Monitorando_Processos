import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/processo.dart';
import '../view/util.dart';

class ProcessoController {
  void adicionar(context, Processo p) {
    FirebaseFirestore.instance
        .collection('processos')
        .add(p.toJson())
        .then((value) => sucesso(context, 'Processo incluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Processo p) {}
}
