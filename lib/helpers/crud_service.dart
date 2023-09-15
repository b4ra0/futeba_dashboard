abstract class CrudService<T> {
  Future<List<T>> listar({
    Map<String, dynamic>? parametros,
    Map<String, dynamic>? opcoesExtras,
  });

  Future<T> buscar(int id, [Map<String, dynamic>? opcoesExtras]);

  Future<T> cadastrar(Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]);

  Future<T> atualizar(T modelo, Map<String, dynamic> dados, [Map<String, dynamic>? opcoesExtras]);

  Future remover(T modelo, [Map<String, dynamic>? opcoesExtras]);
}