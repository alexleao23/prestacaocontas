class User {
  int id;
  String nome;
  String email;
  String data_nasc;
  String api_token;
  String created_at;
  String updated_at;

  User(
      {this.id,
      this.nome,
      this.email,
      this.data_nasc,
      this.api_token,
      this.created_at,
      this.updated_at});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        data_nasc: json['data_nasc'],
        api_token: json['api_token'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
