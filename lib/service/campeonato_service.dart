import 'package:dio/dio.dart';
import 'package:futeba/helpers/crud_service.dart';
import 'package:futeba/models/campeonato.dart';

class CampeonatoService implements CrudService<Campeonato> {
  final Dio dio = Dio();
  @override
  Future<Campeonato> atualizar(Campeonato campeonato, Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.put("http://localhost:8000/campeonatos/${campeonato.id}", data: dados);

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<Campeonato> buscar(int id, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.get("http://localhost:8000/campeonatos/$id");

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<Campeonato> cadastrar(Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.post("http://localhost:8000/campeonatos", data: dados);

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<List<Campeonato>> listar({Map<String, dynamic>? parametros, Map<String, dynamic>? opcoesExtras}) async {
    final resposta = await dio.get("http://localhost:8000/campeonatos");
    
    print(resposta.data);

    return resposta.data.map<Campeonato>((campeonato) => Campeonato.fromJson(campeonato)).toList();
  }

  @override
  Future remover(Campeonato campeonato, [Map<String, dynamic>? opcoesExtras]) async {
    await dio.delete('http://localhost:8000/campeonatos/${campeonato.id}');
  }

}