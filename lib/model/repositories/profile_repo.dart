import 'package:dio/dio.dart';
import 'package:fady/model/api/network_helper.dart';
import 'package:flutter/material.dart';

import '../models/profile_model.dart';

abstract class ProfileRepo {
  static Future<dynamic> getProfile({
    @required String first_name,
    @required String last_name,
  }) async {
    Map<String, dynamic> _query = {
      "fname": first_name,
      "lname": last_name,
    };
    return await NetworkHelper()
        .get(url: 'profile.php', query: _query, model: ProfileModel());
  }
}
