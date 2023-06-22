class Enviado {
  final String uid;
  final String protocoloEnviado;
  final String dataEnviado;
  //final DateTime dataEnviado;
  final String anotacaoEnviado;

  Enviado(this.uid, this.protocoloEnviado, this.dataEnviado, this.anotacaoEnviado);
  

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'protocoloEnviado': protocoloEnviado,
      'dataEnviado': dataEnviado,
      'anotacaoEnviado': anotacaoEnviado
    };
  }

  factory Enviado.fromJson(Map<String, dynamic> json) {
    return Enviado(
      json['uid'],
      json['protocoloEnviado'],
      json['dataEnviado'],
      json['anotacaoEnviado'],
    );
  }
}
