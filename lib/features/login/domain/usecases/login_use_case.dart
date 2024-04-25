import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce_c10_monday/features/login/domain/repository/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  LoginRepo repo;
  LoginUseCase(this.repo);

  Future<Either<Failures, ResponseEntity>> call(
          String email, String password) =>
      repo.login(email, password);
}
