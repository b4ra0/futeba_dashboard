import 'package:futeba/models/campeonato.dart';
import 'package:futeba/models/time.dart';

class Edicao {
  final int id;
  final Campeonato campeonato;
  final List<Time> times;
  final Time? campeao;

  Edicao(
      {required this.id,
      required this.campeonato,
      required this.times,
      this.campeao}
  );

  Edicao.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        campeonato = Campeonato.fromJson(json['campeonato']),
        times = json['times'].map<Time>((time) => Time.fromJson(time)).toList(),
        campeao =
            json['campeao'] != null ? Time.fromJson(json['campeao']) : null;

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'campeonato': campeonato.toJson(),
        'times': times.map((time) => time.toJson()).toList(),
        'campeao': campeao?.toJson()
      };
}
