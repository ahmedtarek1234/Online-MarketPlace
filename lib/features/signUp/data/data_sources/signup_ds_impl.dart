import 'package:e_commerce_c10_monday/core/api/api_manager.dart';
import 'package:e_commerce_c10_monday/core/api/end_points.dart';
import 'package:e_commerce_c10_monday/features/signUp/data/data_sources/signup_ds.dart';
import 'package:e_commerce_c10_monday/features/signUp/data/models/SignUpModel.dart';
import 'package:e_commerce_c10_monday/features/signUp/domain/entities/SignUpRequestModel.dart';

class SignUpDSImpl implements SignUpDS {
  @override
  Future<SignUpModel> signUp(SignUpRequestModel requestModel) async {
    ApiManager apiManager = ApiManager();

    var response = await apiManager.postData(EndPoints.signUp,
        body: requestModel.toJson());

    SignUpModel signUpModel = SignUpModel.fromJson(response.data);
    return signUpModel;
  }
}
