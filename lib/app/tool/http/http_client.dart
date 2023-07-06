import 'package:dio/dio.dart';

class HttpClient{
  static const String baseUrl = 'https://xiaomi.itying.com/api/';
  String? route;
  String? params;
  late Dio myDio;

  HttpClient(){
     myDio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
      ),
    );
  }
  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    final response = await myDio.get(
      path,
      queryParameters: params,
    );
    print(path);
    print(params);
    print("********");
    return response;
  }

  Future<Response> post(
      String path, {
        Map<String, dynamic>? data,
      }) async {
    final response = await myDio.post(
      path,
      data: data,
    );
    return response;
  }
}
