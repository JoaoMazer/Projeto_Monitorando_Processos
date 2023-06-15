// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(
          children: [
            Text(
              'Monitoramento de processos \n Entre com seu usuário \n ou crie um usuário',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 60),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder()),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Esqueci a senha!"),
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              Text(
                                "Preencha seu e-mail para enviarmos as instruções e um link para criar uma nova senha.",
                              ),
                              SizedBox(height: 25),
                              TextField(
                                controller: txtEmailEsqueceuSenha,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actionsPadding: EdgeInsets.all(20),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('retornar a tela de login'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              LoginController().esqueceuSenha(
                                context,
                                txtEmailEsqueceuSenha.text,
                              );
                            },
                            child: Text('enviar e-mail para recuperar a senha'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Esqueceu a senha?'),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40),
                backgroundColor: Color(0xFF3C5A99),
              ),
              onPressed: () {
                LoginController().login(
                  context,
                  txtEmail.text,
                  txtSenha.text,
                );
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cadastrar');
                  },
                  child: Text('Criar um usuário'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}