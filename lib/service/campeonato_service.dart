import 'package:dio/dio.dart';
import 'package:futeba/helpers/api_client.dart';
import 'package:futeba/helpers/crud_service.dart';
import 'package:futeba/helpers/injector.dart';
import 'package:futeba/models/campeonato.dart';

class CampeonatoService implements CrudService<Campeonato> {
  final apiClient = Injector.container<ApiClient>();

  @override
  Future<Campeonato> atualizar(Campeonato campeonato, Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.put("/campeonatos/${campeonato.id}", dados);

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<Campeonato> buscar(int id, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.get("/campeonatos/$id");

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<Campeonato> cadastrar(Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]) async {
    final resposta = await apiClient.post("/campeonatos", dados);

    return Campeonato.fromJson(resposta.data);
  }

  @override
  Future<List<Campeonato>> listar({Map<String, dynamic>? parametros, Map<String, dynamic>? opcoesExtras}) async {
    final resposta = await apiClient.get("/campeonatos");
    
    print(resposta.data);

    return resposta.data.map<Campeonato>((campeonato) => Campeonato.fromJson(campeonato)).toList();
  }

  @override
  Future remover(Campeonato campeonato, [Map<String, dynamic>? opcoesExtras]) async {
    await apiClient.delete('/campeonatos/${campeonato.id}');
  }
}