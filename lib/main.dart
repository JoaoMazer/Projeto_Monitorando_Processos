// ignore_for_file: prefer_const_constructors

import 'package:monitorando_processos/view/anotacao_view.dart';
import 'package:monitorando_processos/view/login_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'view/cadastrar_view.dart';
import 'view/principal_view.dart';
import 'view/menu.dart';
import 'view/enviar.dart';
import 'view/receber.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'cadastrar': (context) => CadastrarView(),
          'login': (context) => LoginView(),
          'menu': (context) => MenuView(),
          'principal':(context)=> PrincipalView(),
          'enviar': (context) => EnviarView(),
          'receber': (context) => ReceberView(),
          'anotacao' :(context) => AnotacoesView()
        },
      ),
    ),
  );
}