class Clube{
  final int id;
  final String nomeCompleto;
  final String? nomePopular;
  final DateTime fundacao;

  Clube({required this.id, required this.nomeCompleto, this.nomePopular, required this.fundacao});

  Clube.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nomeCompleto = json['nome_completo'],
      nomePopular = json['nome_popular'],
      fundacao = DateTime.parse(json['fundacao']);

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'nome_completo': nomeCompleto,
    'nome_popular': nomePopular,
    'fundacao': fundacao.toIso8601String()
  };
}