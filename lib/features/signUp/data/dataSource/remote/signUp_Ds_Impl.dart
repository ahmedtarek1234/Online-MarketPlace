import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/features/signUp/data/dataSource/remote/signUpDs.dart';
import 'package:e_commerce/features/signUp/data/models/signUp_model.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';

class signUpDsImpl implements signUpDs {
  @override
  Future<signUpModel> signUp(signUpRequestModel requestModel) async {
    ApiManager apiManager = ApiManager();
    var response = await apiManager.postData(
        endPoint: EndPoints.signUp, body: requestModel.toJson());
    signUpModel SignUpModel = signUpModel.fromJson(response.data);
    return SignUpModel;
  }
}
