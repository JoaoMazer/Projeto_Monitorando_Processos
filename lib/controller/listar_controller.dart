import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_controller.dart';

class ListarController {  
  
  listarEnviado() {
    return FirebaseFirestore.instance
        .collection('enviado');
        //.where('uid', isEqualTo: LoginController().idUsuario());
  }
   listarRecebido() {
    return FirebaseFirestore.instance
        .collection('recebido');
        //.where('uid', isEqualTo: LoginController().idUsuario());
  }     
        
  }
