import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/login/data/datasources/remote/login_ds.dart';
import 'package:e_commerce_c10_monday/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce_c10_monday/features/login/domain/repository/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  LoginRemoteDS loginRemoteDS;
  LoginRepoImpl(this.loginRemoteDS);
  @override
  Future<Either<Failures, ResponseEntity>> login(
      String email, String password) async {
    try {
      var userModel = await loginRemoteDS.login(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }


}
