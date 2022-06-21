import 'package:fady/model/models/base_models/students.dart';

import '../api/mapper.dart';

class AttendModel extends SingleMapper {
  AttendModel({
    this.students,
  });
  List<Student> students;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return AttendModel(
      students: json["students"] == null
          ? null
          : List<Student>.from(
              json["students"].map((x) => Student.fromJson(x))),
    );
  }
}
