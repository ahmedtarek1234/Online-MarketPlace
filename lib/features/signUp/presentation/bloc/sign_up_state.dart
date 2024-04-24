part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
  RequestStatus? status;
  signUpModel? model;
  Failurs? failurs;

  SignUpState({this.failurs, this.status, this.model});

  SignUpState copyWith({RequestStatus? status,
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
      status: RequestStatus.init
  );
}
