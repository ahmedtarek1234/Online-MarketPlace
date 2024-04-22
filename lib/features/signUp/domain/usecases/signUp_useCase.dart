import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';
import 'package:e_commerce/features/signUp/domain/repositry/SignUpRepo.dart';

class signUpUseCase {
  signUpRepo repo;

  signUpUseCase(this.repo);

  Future<Either<Failurs, signUpModel>> call(signUpRequestModel requestModel) =>
      repo.signUp(requestModel);
}
