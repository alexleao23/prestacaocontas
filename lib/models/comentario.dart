class Comentario {
  int id;
  var despesa_id;
  String descricao;
  String nome_usuario;
  Map<String, dynamic> created_at;

  Comentario(
      {this.id,
      this.despesa_id,
      this.descricao,
      this.nome_usuario,
      this.created_at,
      });

  factory Comentario.fromJson(Map<String, dynamic> json) {
    return Comentario(
      id: json['id'],
      despesa_id: json['despesa_id'],
      descricao: json['descricao'],
      nome_usuario: json['nome_usuario'],
      created_at: json['created_at'],
    );
  }
}
