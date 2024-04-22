import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';

abstract class signUpRepo{
 Future<Either<Failurs,signUpModel>> signUp(signUpRequestModel requestModel);
}