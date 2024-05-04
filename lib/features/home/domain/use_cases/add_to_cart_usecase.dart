import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CartModel.dart';
import 'package:e_commerce_c10_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class addToCartUseCase {
  HomeRepo repo;

  addToCartUseCase(this.repo);

  Future<Either<Failures, CartModel>> call(String productId) =>
      repo.addToCart(productId);
}
