// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monitorando_processos/view/listarrecebido_view.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:monitorando_processos/view/login_view.dart';
import 'view/cadastrar_view.dart';

import 'view/menu.dart';
import 'view/enviado_view.dart';
import 'view/recebido_view.dart';
import 'view/listarenviado_view.dart';



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
          'login': (context) => LoginView(),
          'cadastrar': (context) => CadastrarView(),
          'menu': (context) => MenuView(),
          'enviado': (context) => EnviadoView(),
          'recebido': (context) => RecebidoView(),
          'listarenviado': (context) => ListarEnviadoView(),
          'listarrecebido': (context) => ListarRecebidoView(),
        },
      ),
    ),
  );
}