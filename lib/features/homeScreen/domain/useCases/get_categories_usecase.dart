import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';
import 'package:e_commerce/features/homeScreen/domain/repositres/home_repo.dart';

class CategoriesUseCase {
  HomeRepo homeRepo;

  CategoriesUseCase(this.homeRepo);

  Future<Either<Failurs, CategoriesModel>> call() => homeRepo.getCategories();
}
