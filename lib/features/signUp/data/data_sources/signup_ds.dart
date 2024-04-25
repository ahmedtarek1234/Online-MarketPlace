import 'package:e_commerce_c10_monday/features/signUp/data/models/SignUpModel.dart';
import 'package:e_commerce_c10_monday/features/signUp/domain/entities/SignUpRequestModel.dart';

abstract class SignUpDS{

 Future<SignUpModel> signUp(SignUpRequestModel requestModel);
}