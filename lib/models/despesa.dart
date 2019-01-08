class Despesa {
  int id;
  int deputado_id;
  String nome_deputado;
  String sigla_uf;
  String sigla_partido;
  String descricao;
  String fornecedor;
  String cpfcnpj_fornecedor;
  String data_emissao;
  String valor_documento;
  int mes_documento;
  int ano_documento;
  Map<String, dynamic> reacao_usuario;
  int num_reacoes_pos;
  int num_reacoes_neg;

  Despesa(
      {this.id,
      this.deputado_id,
      this.nome_deputado,
      this.sigla_uf,
      this.sigla_partido,
      this.descricao,
      this.fornecedor,
      this.cpfcnpj_fornecedor,
      this.data_emissao,
      this.valor_documento,
      this.mes_documento,
      this.ano_documento,
      this.reacao_usuario,
      this.num_reacoes_pos,
      this.num_reacoes_neg});

  factory Despesa.fromJson(Map<String, dynamic> json) {
    return Despesa(
        id: json['id'],
        deputado_id: json['deputado_id'],
        nome_deputado: json['nome_deputado'],
        sigla_uf: json['sigla_uf'],
        sigla_partido: json['sigla_partido'],
        descricao: json['descricao'],
        fornecedor: json['fornecedor'],
        cpfcnpj_fornecedor: json['cpfcnpj_fornecedor'],
        data_emissao: json['data_emissao'],
        valor_documento: json['valor_documento'],
        mes_documento: json['mes_documento'],
        ano_documento: json['ano_documento'],
        reacao_usuario: json['reacao_usuario'],
        num_reacoes_pos: json['num_reacoes_pos'],
        num_reacoes_neg: json['num_reacoes_neg']);
  }
}
