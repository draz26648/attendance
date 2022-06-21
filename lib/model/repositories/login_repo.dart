import 'package:dio/dio.dart';
import 'package:fady/model/api/network_helper.dart';
import 'package:fady/model/models/login_model.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo {
  static Future<dynamic> login({
    @required String email,
    @required String password,
    @required bool isAdmin,
  }) {
    FormData _body = FormData.fromMap({
      'email': email,
      'password': password,
      'isAdmin': isAdmin,
    });
    print(_body);
    return NetworkHelper().post(
      url: 'login.php',
      body: _body,
      model: LoginModel(),
    );
  }
}
