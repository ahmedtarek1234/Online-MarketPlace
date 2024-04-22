import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/enums/screen_status.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';
import 'package:e_commerce/features/signUp/domain/usecases/signUp_useCase.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  signUpUseCase SignUpUsecase;

  SignUpBloc(this.SignUpUsecase) : super(signUpInitState()) {
    on<SignUpButtonEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await SignUpUsecase(event.requestModel);
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failurs: l));
      }, (r) {
        emit(state.copyWith(status: ScreenStatus.success, model: r));
      });
    });
  }
}
