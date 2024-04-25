import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failuers.dart';
import '../../data/models/BrandModel.dart';

@injectable
class GetBrandsUseCase {
  HomeRepo repo;
  GetBrandsUseCase(this.repo);

  Future<Either<Failures, BrandModel>> call() => repo.getBrands();
}
