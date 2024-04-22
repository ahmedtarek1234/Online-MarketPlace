import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/signUp/data/dataSource/remote/signUpDs.dart';
import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';
import 'package:e_commerce/features/signUp/domain/repositry/SignUpRepo.dart';

class SignUpRepoImpl implements signUpRepo {
  signUpDs SignUpDs;

  SignUpRepoImpl(this.SignUpDs);

  @override
  Future<Either<Failurs, signUpModel>> signUp(
      signUpRequestModel requestModel) async {
    try {
      var result = await SignUpDs.signUp(requestModel);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailurs(e.toString()));


    }
  }

}