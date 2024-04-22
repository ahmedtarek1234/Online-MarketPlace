import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/features/login/data/dataSource/remote/remote_login_ds.dart';
import 'package:e_commerce/features/login/data/models/userModel.dart';

class RemoteLoginDsImpl implements RemoteLoginDs{
  @override
  Future<userModel> login(String email, String password)async {
ApiManager apiManager=ApiManager();
var response =await apiManager.postData(endPoint:  EndPoints.login,body: {
  "email":email,
  "password":password
});
userModel UserModel =userModel.fromJson(response.data);
return UserModel;

  }
  
} 