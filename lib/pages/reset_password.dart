import 'package:flutter/material.dart';
import 'login.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 224, 237, 243),
       leading: IconButton(
       icon: Icon(Icons.arrow_back),
       color:Colors.black38,
       onPressed:()=>Navigator.pop(context, false),
      ),
    ),
       body: Container(
         padding:EdgeInsets.only(
           top:60, 
           left: 40, 
           right: 40
           ),
         color:Color.fromARGB(255, 224, 237, 243),
         child: ListView(
           children:<Widget> [
             SizedBox(
               width: 200,
               height: 200,
               child: Image.asset("assets/reset-password-icon.png"),
             ),
             SizedBox(
               height:20 ,
               ),
               Text(
                 "Esqueceu sua senha?",
                 style: TextStyle(
                   fontSize:32,
                   fontWeight:FontWeight.w500,
                     ),
                     textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: 10,
               ),
               Text(
                 "Por favor, informe o e-mail cadastrado para receber instruções de recuperação de senha.",
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                 ),
                 textAlign: TextAlign.center,
               ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 keyboardType:TextInputType.emailAddress,
                 decoration:InputDecoration(
                   labelText: "E-mail",
                   labelStyle: TextStyle(
                     color:Colors.black38,
                     fontWeight:FontWeight.w400,
                     fontSize:20,
                      ),
                 ),
                 style:TextStyle(
                   fontSize: 20,
                   ),
               ),
               SizedBox(
                 height: 20,
               ),
               Container(
                 height: 60,
                 alignment: Alignment.centerLeft,
                 decoration: BoxDecoration(
                   gradient:LinearGradient(
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                     stops: [0.3,1],
                     colors: [
                       Color.fromRGBO(173,216,230, 1),
                       Color.fromRGBO(35,35,142, 1),
                     ],
                   ),
                   borderRadius: BorderRadius.all(
                     Radius.circular(5),
                     ),
                 ),
                 child:SizedBox.expand(
                   child: TextButton(
                     child:Text(
                       "Enviar Instruções",
                       style: TextStyle(
                         fontWeight:FontWeight.bold,
                         color:Color.fromARGB(255, 224, 237, 243),
                         fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                     ),
                     onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> Login(),
                       ),
                  );},
                   ),
                 ),
               ),
               SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text(
                      "Cancelar",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: ()=> Navigator.pop(context, false),
                    ),
                ),
           ],
         ),
         ),
    );
  }
}
