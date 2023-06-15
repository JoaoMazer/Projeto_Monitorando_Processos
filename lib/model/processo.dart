class Processo {
  final String uid;
  final String protocolo;
  final String data_envio;
  final String anotacao;

  Processo(this.uid, this.protocolo, this.data_envio, this.anotacao);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'protocolo': protocolo,
      'data_envio': data_envio,
      'anotacao': anotacao
    };
  }

  factory Processo.fromJson(Map<String, dynamic> json) {
    return Processo(
      json['uid'],
      json['protocolo'],
      json['data_envio'],
      json['anotacao'],
    );
  }
}
