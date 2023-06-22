import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';

class LoginController {
  //
  // Criação de um nova conta de usuário
  // no Firebase Authentication
  //
  criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((resultado) {
      //Conta Criada com Sucesso
      FirebaseFirestore.instance.collection('usuarios').add(
        {
        'uid': resultado.user!.uid,
        'nome': nome,
        }
        );

      sucesso(context, 'Usuário criado, bem vindo!!');
      Navigator.pop(context);
    }).catchError((e) {
      //Não foi possível criar a conta
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'Esse email já está cadastrado, faça a recuperação de senha.');
          break;
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // LOGIN
  // Efetuar o login de um usuário previamente cadastrado
  // no serviço Firebase Authentication
  //
  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'menu');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'Esse formato de e-mail não parece correto!!');
          break;
        case 'user-not-found':
          erro(context, 'Não encontramos um usuário com esse e-mail e senha!!.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  // Envia uma mensagem de email para recuperação de senha para
  // um conta de email válida
  //
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar o acesso.');
    }
    Navigator.pop(context);
  }

  //
  //logout
  //
  logout(){
    FirebaseAuth.instance.signOut();
  }

    //
  // ID do Usuário Logado
  //
  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  //
  // NOME do Usuário Logado
  //
  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }
}