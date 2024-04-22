import 'package:e_commerce/features/login/data/models/userModel.dart';

abstract class RemoteLoginDs{
  Future<userModel> login(String email, String password);
}

