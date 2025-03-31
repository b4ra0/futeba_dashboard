import 'package:dio/dio.dart';
import 'package:futeba/helpers/api_client.dart';
import 'package:futeba/helpers/crud_service.dart';
import 'package:futeba/helpers/injector.dart';
import 'package:futeba/models/clube.dart';

class ClubeService implements CrudService<Clube> {
  final apiClient = Injector.container<ApiClient>();

  @override
  Future<Clube> atualizar(Clube clube, Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.put("/clubes/${clube.id}", dados);

    return Clube.fromJson(resposta.data);
  }

  @override
  Future<Clube> buscar(int id, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.get("/clubes/$id");

    return Clube.fromJson(resposta.data);
  }

  @override
  Future<Clube> cadastrar(Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.post("/clubes", dados);

    return Clube.fromJson(resposta.data);
  }

  @override
  Future<List<Clube>> listar({Map<String, dynamic>? parametros, Map<String, dynamic>? opcoesExtras}) async {
    final resposta = await apiClient.get("/clubes");

    return resposta.data.map<Clube>((clube) => Clube.fromJson(clube)).toList();
  }

  @override
  Future remover(Clube clube, [Map<String, dynamic>? opcoesExtras]) async {
    await apiClient.delete('/clubes/${clube.id}');
  }
}