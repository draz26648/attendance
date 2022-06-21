import 'package:fady/model/api/network.dart';

class AddUser extends SingleMapper {
  AddUser({this.status});
  String status;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    status = json['status'] == null ? null : json['status'];
  }
}
