import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';

abstract class signUpDs {
  Future<signUpModel> signUp(signUpRequestModel requestModel);
}
