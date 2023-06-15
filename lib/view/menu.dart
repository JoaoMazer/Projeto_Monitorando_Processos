import 'package:flutter/material.dart';
import 'package:monitorando_processos/view/login_view.dart';
import 'enviar.dart';
import 'receber.dart';
import "anotacao_view.dart";

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        padding: EdgeInsets.only(
          top: 60, 
          left: 40, 
          right: 40,
        ),
        color: Color.fromARGB(255, 224, 237, 243),
        child: ListView(
          children:<Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("assets/app-logo.png"),            
            ),
            
            Container(
              height:50,
              alignment: Alignment.center,
              child:TextButton(
                child: Text("Voltar a tela de Login"),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> LoginView(),
                       ),
                  );
                },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height:60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xFF3C5A99),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )
                    ),
                    child:SizedBox.expand(
                      child:TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Enviar processos",
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Color.fromARGB(255, 224, 237, 243),
                                fontSize:20,
                              ),
                              textAlign: TextAlign.left,
                              ),
                              Container(
                                child:SizedBox(
                                  child:Image.asset("assets/logoenviar.png"),
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                          ],
                        ),
                        onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> EnviarView(),
                       ),
                  ),
                  },
                      ),
                    ),
                     ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color:Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child:TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Receber processos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 224, 237, 243),
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/logoreceber.png"),
                          height: 40,
                          width: 40,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ReceberView(),
                       ),
                  );},
                ),
                ),
            ),
            

            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color:Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child:TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Anotação em um processo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 224, 237, 243),
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/logoanotacao.png"),
                          height: 40,
                          width: 40,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> AnotacoesView(),
                       ),
                      );
                            }
              ),
              ),
         ),
          ],
               
        ),
      ),
                                


    );
    }
      }