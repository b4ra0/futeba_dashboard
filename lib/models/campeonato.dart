import 'package:futeba/models/edicao.dart';

class Campeonato {
  final int id;
  final String nome;
  final List<Edicao> edicoes;

  Campeonato({required this.id, required this.nome, required this.edicoes});

  Campeonato.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        edicoes = json['edicoes']
            .map<Edicao>((edicao) {
              print(edicao);
              return Edicao.fromJson(edicao);
        })
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'nome': nome,
        'edicoes': edicoes.map((edicao) => edicao.toJson()).toList()
      };
}
