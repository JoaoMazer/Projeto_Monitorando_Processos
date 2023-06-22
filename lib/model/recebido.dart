class Recebido {
  final String uid;
  final String protocoloRecebido;
  final String dataRecebido;
  final String anotacaoRecebido;

  Recebido(this.uid, this.protocoloRecebido, this.dataRecebido, this.anotacaoRecebido);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'protocoloRecebido': protocoloRecebido,
      'dataRecebido': dataRecebido,
      'anotacaoRecebido': anotacaoRecebido
    };
  }

  factory Recebido.fromJson(Map<String, dynamic> json) {
    return Recebido(
      json['uid'],
      json['protocoloRecebido'],
      json['dataRecebido'],
      json['anotacaoRecebido'],
    );
  }
}
