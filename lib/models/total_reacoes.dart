class TotalReacoes {
  int deputado_id;
  String nome_deputado;
  int reacoes_positivas;
  int reacoes_negativas;
  int total_reacoes;

  TotalReacoes({this.deputado_id, this.nome_deputado, this.reacoes_positivas, this.reacoes_negativas, this.total_reacoes});

  factory TotalReacoes.fromJson(Map<String, dynamic> json){
    return TotalReacoes(
      deputado_id: json['deputado_id'],
      nome_deputado: json['nome_deputado'],
      reacoes_positivas: json['reacoes_positivas'],
      reacoes_negativas: json['reacoes_negativas'],
      total_reacoes: json['total_reacoes']
    );
  }
}