class Reacao {
  int usuario_id;
  String despesa_id;
  String reacao;
  String updated_at;
  String created_at;
  int id;

  Reacao({this.id, this.created_at, this.updated_at, this.reacao, this.usuario_id, this.despesa_id});

  factory Reacao.fromJson(Map<String, dynamic> json) {
    return Reacao(
      usuario_id: json['usuario_id'],
      despesa_id: json['despesa_id'],
      reacao: json['reacao'],
      updated_at: json['updated_at'],
      created_at: json['created_at'],
      id: json['id'],
    );
  }
//   {
//   "usuario_id": 1,
//   "despesa_id": "1",
//   "reacao": 0,
//   "updated_at": "2019-01-06 19:37:41",
//   "created_at": "2019-01-06 19:37:41",
//   "id": 166
// }
}