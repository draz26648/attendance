import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'mapper.dart';

class NetworkHelper {
  static NetworkHelper _instance;
  static Dio _dio;

  NetworkHelper._internal();

  factory NetworkHelper() {
    if (_instance == null) {
      _dio = Dio();
      _dio.options.baseUrl = 'http://127.0.0.1:80/public_html/';
      _instance = NetworkHelper._internal();
    }
    return _instance;
  }

  Future<dynamic> get(
      {@required String url,
      Mapper model,
      Map<String, dynamic> query,
      var headers}) async {
    Response _res;
    if (headers != null) {
      _dio.options.headers = headers;
    } else {
      _dio.options.headers = {'Accept': 'application/json'};
    }
    print('End point: => $url');
    try {
      _res = await _dio.get(url, queryParameters: query);
    } on DioError catch (e) {
      print('Exception in $url: => ${e.response.toString()}');
      _res = e.response;
    }
    print('Response of $url: => ${_res.toString()}');
    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }

  Future<dynamic> post(
      {@required String url, var body, Mapper model, var headers}) async {
    Response _res;
    try {
      if (headers != null) {
        _dio.options.headers = headers;
      } else {
        _dio.options.headers = {'Accept': 'application/json'};
      }
      print('End point => $url');
      if (body != null) print(body.fields);
      _res = await _dio.post(url, data: body);
    } on DioError catch (e) {
      print('Exception in $url: => ${e.response.toString()}');
      _res = e.response;
    }
    print('Response of $url: => ${_res.toString()}');
    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }
}
