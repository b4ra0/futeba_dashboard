class Time{
  final int id;
  final String nome;
  final String urlBrasao;

  Time({required this.id, required this.nome, required this.urlBrasao});

  Time.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nome = json['nome'],
      urlBrasao = json['url_brasao'];

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'nome': nome,
    'url_brasao': urlBrasao,
  };
}