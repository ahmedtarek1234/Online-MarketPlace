import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  UserEntity? user;
  String? token;

  ResponseEntity({this.user, this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token, user];
}

class UserEntity extends Equatable {
  String? name;
  String? email;

  UserEntity({this.name, this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email];
}
