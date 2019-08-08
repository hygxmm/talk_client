import 'dart:async';
import 'package:dio/dio.dart';

class Fetch {
  static Dio dio;
  // static const String BASEURL = 'http://localhost:3000/api/';
  static const String BASEURL = 'http://192.168.0.102:3000/api/';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static Future<Map> get(String path, {data}) async {
    data = data ?? {};
    Dio dio = createInstance();
    Response response;
    try {
      response = await dio.get(path, queryParameters: data);
    } on DioError catch (e) {
      print("请求错误: " + e.toString());
    }
    return response.data;
  }

  static Future<Map> post(String path, {data}) async {
    data = data ?? {};
    Dio dio = createInstance();
    Response response;
    try {
      response = await dio.post(path, data: data);
    } on DioError catch (e) {
      print("请求错误: " + e.toString());
    }
    return response.data;
  }

  //创建Dio实例对象
  static createInstance() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: BASEURL,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  //清空dio对象
  static clear() {
    dio = null;
  }
}
