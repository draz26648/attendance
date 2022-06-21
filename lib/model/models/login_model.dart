import 'package:fady/model/api/network.dart';

class LoginModel extends SingleMapper {
  LoginModel({
    this.status,
    this.message,
    this.phone,
    this.email,
    this.first_name,
    this.last_name,
  });

  String status;
  String message;
  String phone;
  String email;
  String first_name;
  String last_name;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] == null ? null : json['status'],
      message: json['message'] == null ? null : json['message'],
      phone: json['phone'] == null ? null : json['phone'],
      email: json['email'] == null ? null : json['email'],
      first_name: json['first_name'] == null ? null : json['first_name'],
      last_name: json['last_name'] == null ? null : json['last_name'],
    );
  }
}
