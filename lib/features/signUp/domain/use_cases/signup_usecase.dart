import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/signUp/data/models/SignUpModel.dart';
import 'package:e_commerce_c10_monday/features/signUp/domain/entities/SignUpRequestModel.dart';
import 'package:e_commerce_c10_monday/features/signUp/domain/repositories/signUpRepo.dart';

class SignUpUseCase {
  SignUpRepo repo;
  SignUpUseCase(this.repo);

  Future<Either<Failures, SignUpModel>> call(SignUpRequestModel requestModel) =>
      repo.signUp(requestModel);
}
