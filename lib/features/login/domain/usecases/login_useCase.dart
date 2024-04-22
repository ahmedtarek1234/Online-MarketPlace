import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce/features/login/domain/repositry/login_repo.dart';

class loginUseCase {
  loginRepo LoginRepo;

  loginUseCase(this.LoginRepo);

 Future<Either<Failurs,ResponseEntity>> call(String email, String password) => LoginRepo.login(email, password);
}
