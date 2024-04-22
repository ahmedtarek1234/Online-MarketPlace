import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/login/data/dataSource/remote/remote_login_ds.dart';
import 'package:e_commerce/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce/features/login/domain/repositry/login_repo.dart';

import '../../../../core/error/faliurs.dart';

class loginRepoImpl implements loginRepo {
  RemoteLoginDs loginDs;

  loginRepoImpl(this.loginDs);

  @override
  Future<Either<Failurs,ResponseEntity>> login(String email, String password) async {
    try {
      var response =await loginDs.login(email, password);
      return right(response);
    } catch (e) {
return left(RemoteFailurs(e.toString()));

    }
  }
}
