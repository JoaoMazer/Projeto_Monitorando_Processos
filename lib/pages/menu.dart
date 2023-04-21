import 'package:flutter/material.dart';
import 'package:monitorando_processos/pages/login.dart';
import 'package:monitorando_processos/pages/reset_password.dart';


import 'enviar.dart';
import 'receber.dart';

class MenuScreen extends StatelessWidget {
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
            child: Image.asset("assets/logo.png"),
            ),
            
            Container(
              height:40,
              alignment: Alignment.center,
              child:TextButton(
                child: Text(
                  "Voltar",
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> Login(),
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
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end:Alignment.bottomRight,
                        stops:[0.3,1],
                        colors:[
                          Color.fromRGBO(173,216,230, 1),
                          Color.fromRGBO(35,35,142, 1),
                        ],
                      ),
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
                              "Enviar",
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
                                  height: 28,
                                  width:28,
                                ),
                              ),
                          ],
                        ),
                        onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> EnviarScreen(),
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
                        "Receber",
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
                          height: 28,
                          width: 28,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ReceberScreen(),
                       ),
                  );},
                ),
                ),
            ),
            SizedBox(
              height:10,
            ),
            Container(
              height: 40,
              child:TextButton(
                child: Text(
                  "Sair",
                  textAlign: TextAlign.center,
                ),

                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> Login(),
                       ),
                  );
                },
                
              )
            ),
            ],
              ),
            ),
        );
  }
}
