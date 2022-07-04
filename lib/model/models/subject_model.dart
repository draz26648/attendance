import 'package:fady/model/api/mapper.dart';

class SubjectModel extends SingleMapper {
  SubjectModel({
    this.status,
    this.email,
    this.coursesNames,
  });

  String status;
  String email;
  List<String> coursesNames;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        status: json['status'] == null ? null : json['status'],
        email: json['email'] == null ? null : json['email'],
        coursesNames: json['courses_names'] == null
            ? null
            : List<dynamic>.from(coursesNames.map((x) => x)));
  }
}
