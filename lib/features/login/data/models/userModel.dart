import 'package:e_commerce/features/login/domain/entity/ResponseEntity.dart';

class userModel extends ResponseEntity {
  String? message;

  userModel({this.message, super.user, super.token});

  userModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class User extends UserEntity {
  String? role;

  User({super.name, super.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
