import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/login/domain/entity/ResponseEntity.dart';

import '../../../../core/error/faliurs.dart';

abstract class loginRepo{
  Future<Either<Failurs,ResponseEntity>> login(String email,String password);
}