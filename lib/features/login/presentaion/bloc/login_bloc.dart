import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/enums/screen_status.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce/features/login/domain/usecases/login_useCase.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  loginUseCase LoginUseCase;

  LoginBloc(this.LoginUseCase) : super(LoginInitState()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(state.copWith(status: ScreenStatus.loading));
      var result = await LoginUseCase.call(event.email, event.password);
      result.fold((l) {
        emit(state.copWith(status: ScreenStatus.failure,failurs: l));
      }, (r) {
        emit(state.copWith(status: ScreenStatus.success,entity: r));
      });
    });
  }
}
