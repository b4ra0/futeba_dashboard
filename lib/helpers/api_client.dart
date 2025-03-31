import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient{
  final Dio _client;

  ApiClient()
      : _client = Dio(
                    BaseOptions(
                      baseUrl: dotenv.get("HOST"),
                      sendTimeout: 60000,
                      receiveTimeout: 60000,
                      connectTimeout: 60000,
                    ),
                  );

  Future<Response> get(String path, {
    Map<String, String>? queryParams = const {},
    Map<String, String>? headers = const {}}) async {
    return await _client.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, Map<String, dynamic> dados) async {
    return await _client.post(path, data: dados);
  }

  Future<Response> put(String path, Map<String, dynamic> dados) async {
    return await _client.put(path, data: dados);
  }

  Future<Response> delete(String path) async {
    return await _client.delete(path);
  }
}