class Deputado {
  int id;
  String nome_civil;
  String nome_eleitoral;
  String email;
  String sexo;
  String escolaridade;
  String data_nasc;
  String telefone;
  String uf_nasc;
  String municipio_nasc;
  String uf_eleito;
  String sigla_partido;
  String condicao_eleitoral;
  String url_foto;
  int total_reacoes_positivas;
  int total_reacoes_negativas;

  Deputado(
      {this.id,
      this.nome_civil,
      this.nome_eleitoral,
      this.email,
      this.sexo,
      this.escolaridade,
      this.data_nasc,
      this.telefone,
      this.uf_nasc,
      this.municipio_nasc,
      this.uf_eleito,
      this.sigla_partido,
      this.condicao_eleitoral,
      this.url_foto,
      this.total_reacoes_positivas,
      this.total_reacoes_negativas});

  factory Deputado.fromJson(Map<String, dynamic> json) {
    return Deputado(
        id: json['id'],
        nome_civil: json['nome_civil'],
        nome_eleitoral: json['nome_eleitoral'],
        email: json['email'],
        sexo: json['sexo'],
        escolaridade: json['escolaridade'],
        data_nasc: json['data_nasc'],
        telefone: json['telefone'],
        uf_nasc: json['uf_nasc'],
        municipio_nasc: json['municipio_nasc'],
        uf_eleito: json['uf_eleito'],
        sigla_partido: json['sigla_partido'],
        condicao_eleitoral: json['condicao_eleitoral'],
        url_foto: json['url_foto']);
  }
}
