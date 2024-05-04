import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CartModel.dart';
import 'package:e_commerce_c10_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCartIteamsUseCase {
  HomeRepo repo;

  GetCartIteamsUseCase(this.repo);

  Future<Either<Failures, int>> call() =>
      repo.getCartIteams();
}
