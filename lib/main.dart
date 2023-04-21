import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitorando Processos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
    ),
      home: Login(),
    );
  }
}
