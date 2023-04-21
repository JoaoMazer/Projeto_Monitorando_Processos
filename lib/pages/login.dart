
import 'package:flutter/material.dart';

import 'reset_password.dart';
import 'signup.dart';
import 'enviar.dart';
import 'receber.dart';
import 'menu.dart';

class Login extends StatelessWidget {
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              labelText:"E-mail",
              labelStyle:TextStyle(
                color:Colors.black38,
                fontWeight:FontWeight.w400,
                fontSize:20,
              ),
              ),
              style: TextStyle(
                fontSize:20,
                ),
            ),
            SizedBox(
              height:10,
            ),
            TextFormField(
              keyboardType:TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText:"Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style:TextStyle(fontSize: 20),
            ),
            Container(
              height:40,
              alignment: Alignment.centerLeft,
              child:TextButton(
                child: Text(
                  "Não lembro a senha!!",
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ResetPassword(),
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
                              "Login",
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Color.fromARGB(255, 255, 255, 255),
                                fontSize:20,
                              ),
                              textAlign: TextAlign.left,
                              ),
                              Container(
                                child:SizedBox(
                                  child:Image.asset("assets/profile-picture.png"),
                                  height: 28,
                                  width:28,
                                ),
                              ),
                          ],
                        ),
                        onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> MenuScreen(),
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
                        "Login com Facebook",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 176, 218, 253),
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/fb-icon.png"),
                          height: 28,
                          width: 28,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> MenuScreen(),
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
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),

                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> Signup(),
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
