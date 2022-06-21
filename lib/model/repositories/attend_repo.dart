import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/network_helper.dart';
import '../models/attend_model.dart';

abstract class AttendRepo {
  static Future<dynamic> getAttendance({
    @required String day,
    @required String school_year,
    @required String start_time,
  }) async {
    Map<String, dynamic> _query = {
      "day": day,
      "School_year": school_year,
      "start_time": start_time,
    };
    return await NetworkHelper()
        .get(url: 'modify.php', query: _query, model: AttendModel());
  }

  static Future<dynamic> updateAttendance({
    @required String day,
    @required String school_year,
    @required List<String> students,
  }) async {
    FormData _body = FormData.fromMap({
      "day": day,
      "School_year": school_year,
      "students": students,
    });
    return await NetworkHelper()
        .post(url: 'modify.php', body: _body, model: AttendModel());
  }
}
