import 'package:futeba/models/campeonato.dart';
import 'package:futeba/models/clube.dart';

class Edicao {
  final int id;
  final Campeonato campeonato;
  final List<Clube> clube;
  final Clube? campeao;

  Edicao(
      {required this.id,
      required this.campeonato,
      required this.clube,
      this.campeao}
  );

  Edicao.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        campeonato = Campeonato.fromJson(json['campeonato']),
        clube = json['clubes'].map<Clube>((clube) => Clube.fromJson(clube)).toList(),
        campeao =
            json['campeao'] != null ? Clube.fromJson(json['campeao']) : null;

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'campeonato': campeonato.toJson(),
        'clubes': clube.map((clube) => clube.toJson()).toList(),
        'campeao': campeao?.toJson()
      };
}
