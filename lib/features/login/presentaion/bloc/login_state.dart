part of 'login_bloc.dart';

@immutable
class LoginState {
  ScreenStatus? status;
  ResponseEntity? entity;
  Failurs? failurs;

  LoginState({this.entity, this.status, this.failurs});

  LoginState copWith({
    ScreenStatus? status,
    ResponseEntity? entity,
    Failurs? failurs,
  }) {
    return LoginState(
        status: status ?? this.status,
        entity: entity ?? this.entity,
        failurs: failurs ?? this.failurs);
  }
}


class LoginInitState extends LoginState{
  LoginInitState():super(
    status: ScreenStatus.init
  );
}