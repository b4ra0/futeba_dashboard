class Clube{
  final int id;
  final String nome;
  final String? urlBrasao;
  final DateTime fundacao;

  Clube({required this.id, required this.nome, this.urlBrasao, required this.fundacao});

  Clube.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nome = json['nome'],
      urlBrasao = json['url_brasao'],
      fundacao = DateTime.parse(json['fundacao']);

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'nome': nome,
    'url_brasao': urlBrasao,
    'fundacao': fundacao.toIso8601String()
  };
}