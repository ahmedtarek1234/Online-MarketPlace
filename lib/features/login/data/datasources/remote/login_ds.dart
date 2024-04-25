import 'package:e_commerce_c10_monday/features/login/data/models/UserModel.dart';

abstract class LoginRemoteDS {
  Future<UserModel> login(String email, String password);
}
