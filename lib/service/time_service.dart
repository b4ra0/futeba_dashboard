import 'package:dio/dio.dart';
import 'package:futeba/helpers/crud_service.dart';
import 'package:futeba/models/time.dart';

class TimeService implements CrudService<Time> {
  final Dio dio = Dio();
  @override
  Future<Time> atualizar(Time time, Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.put("http://localhost:8000/times/${time.id}", data: dados);

    return Time.fromJson(resposta.data);
  }

  @override
  Future<Time> buscar(int id, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.get("http://localhost:8000/times/$id");

    return Time.fromJson(resposta.data);
  }

  @override
  Future<Time> cadastrar(Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await dio.post("http://localhost:8000/times", data: dados);

    return Time.fromJson(resposta.data);
  }

  @override
  Future<List<Time>> listar({Map<String, dynamic>? parametros, Map<String, dynamic>? opcoesExtras}) async {
    final resposta = await dio.get("http://localhost:8000/times");

    return resposta.data.map<Time>((time) => Time.fromJson(time)).toList();
  }

  @override
  Future remover(Time time, [Map<String, dynamic>? opcoesExtras]) async {
    await dio.delete('http://localhost:8000/times/${time.id}');
  }
}