import 'package:fady/model/api/network.dart';
import 'package:flutter/material.dart';

abstract class SubjectRepo {
  static getSubject({@required String email}) async {
    Map<String, dynamic> _query = {'email': email};
    return await NetworkHelper().get(url: 'subject.php', query: _query);
  }
}
