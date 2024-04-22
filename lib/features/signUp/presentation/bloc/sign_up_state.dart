part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
  ScreenStatus? status;
  signUpModel? model;
  Failurs? failurs;

  SignUpState({this.failurs, this.status, this.model});

  SignUpState copyWith({ScreenStatus? status,
      signUpModel? model,
      Failurs? failurs}){
    return SignUpState(
        status: status ?? this.status,
        model: model ?? this.model,
        failurs: failurs ?? this.failurs);
  }
}
class signUpInitState extends SignUpState{
  signUpInitState():super(
      status: ScreenStatus.init
  );
}
