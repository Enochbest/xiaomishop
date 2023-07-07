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
  Future get(String path, {Map<String, dynamic>? params}) async {
    try{
      final response = await myDio.get(
        path,
        queryParameters: params,
      );
      print(path);
      print(params);
      print("********");
      return response;
    }catch(e){
      return null;
    }

  }

  Future post(String path, {Map<String, dynamic>? data,}) async {
    try{
      final response = await myDio.post(
        path,
        data: data,
      );
      return response;
    }catch(e){
      return null;
    }
  }
}
