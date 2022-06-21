import 'package:dio/dio.dart';
import 'package:fady/model/api/network_helper.dart';
import 'package:fady/model/models/add_user_model.dart';
import 'package:flutter/material.dart';

abstract class AddUserRepo {
  static Future<dynamic> addLecturer({
    @required String first_name,
    @required String last_name,
    @required String email,
    @required String password,
    @required int phone,
    @required String address,
    @required String gender,
  }) {
    FormData _body = FormData.fromMap({
      'fname': first_name,
      'lname': last_name,
      'email': email,
      'password': password,
      'phone': phone,
      'gender': gender,
      'address': address,
    });
    return NetworkHelper()
        .post(url: 'addLecturer.php', body: _body, model: AddUser());
  }

  static Future<dynamic> addStudent({
    @required String first_name,
    @required String last_name,
    @required String email,
    @required int age,
    @required int phone,
    @required String address,
    @required String gender,
    @required String school_year,
  }) {
    FormData _body = FormData.fromMap({
      'email': email,
      'School_year': school_year,
      'fname': first_name,
      'lname': last_name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'address': address,
    });
    return NetworkHelper()
        .post(url: 'addStudent.php', body: _body, model: AddUser());
  }
}
