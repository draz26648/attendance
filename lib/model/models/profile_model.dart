import 'package:fady/model/api/network.dart';

class ProfileModel extends SingleMapper {
  ProfileModel({
    this.phone,
    this.email,
    this.status,
  });
  String phone;
  String email;
  String status;

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      phone: json['phone'] == null ? null : json['phone'],
      email: json['email'] == null ? null : json['email'],
      status: json['status'] == null ? null : json['status'],
    );
  }
}
