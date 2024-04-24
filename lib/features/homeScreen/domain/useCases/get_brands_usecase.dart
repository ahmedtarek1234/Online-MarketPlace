import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/domain/repositres/home_repo.dart';

class BrandsUseCase {
  HomeRepo homeRepo;

  BrandsUseCase(this.homeRepo);

  Future<Either<Failurs, BrandModel>> call() => homeRepo.getBrands();
}
