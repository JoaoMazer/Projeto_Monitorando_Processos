class Anotacao {
  final String uid;
  final String protocolo;
  final String anotacao;

  Anotacao(this.uid, this.protocolo, this.anotacao);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'titulo': protocolo,
      'descricao': anotacao
    };
  }

  factory Anotacao.fromJson(Map<String, dynamic> json) {
    return Anotacao(
      json['uid'],
      json['protocolo'],
      json['anotacao'],
    );
  }
}
