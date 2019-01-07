class Comentario {
  int id;
  int usuario_id;
  var despesa_id;
  String descricao;
  String created_at;
  String updated_at;

  Comentario(
      {this.id,
      this.usuario_id,
      this.despesa_id,
      this.descricao,
      this.created_at,
      this.updated_at});

  factory Comentario.fromJson(Map<String, dynamic> json) {
    return Comentario(
      id: json['id'],
      usuario_id: json['usuario_id'],
      despesa_id: json['despesa_id'],
      descricao: json['descricao'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
