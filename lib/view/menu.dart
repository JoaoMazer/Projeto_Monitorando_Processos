import 'package:flutter/material.dart';
import 'package:monitorando_processos/view/login_view.dart';
import '../controller/login_controller.dart';
import 'enviado_view.dart';
import 'recebido_view.dart';
import 'listarenviado_view.dart';
import 'listarrecebido_view.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color.fromARGB(250, 26, 35, 126),
        title: Row(
          children: [
            Expanded(child: Text('Escolha uma opção')),
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 40),
                      label: Text(snapshot.data.toString()),
                    ),
                  );
                }
                return Text('');
              },
            ),
          ],
        ),
      ),
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
            width: 100,
            height: 100,
            child: Icon(Icons.content_paste, size: 100),
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
                      color: Color.fromARGB(250, 26, 35, 126),
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
                                  child: Icon(Icons.arrow_circle_up_outlined, size: 60),
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                          ],
                        ),
                        onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> EnviadoView(),
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
                color:Color.fromARGB(250, 26, 35, 126),
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
                          child: Icon(Icons.arrow_circle_down, size: 60),
                          height: 80,
                          width: 80,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> RecebidoView(),
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
                color:Color.fromARGB(250, 26, 35, 126),
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
                        "Listar Enviados",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 224, 237, 243),
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(Icons.content_paste_go_rounded, size: 60),
                          height: 80,
                          width: 80,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ListarEnviadoView(),
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
                color:Color.fromARGB(250, 26, 35, 126),
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
                        "Listar Recebidos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color.fromARGB(255, 224, 237, 243),
                          fontSize:20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child:  Icon(Icons.content_paste_search, size: 60,),
                          height: 80,
                          width: 80,
                        ),
                        ),
                    ],
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> ListarRecebidoView(),
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