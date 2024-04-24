import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/homeScreen/data/dataSource/remote/home_ds.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';
import 'package:e_commerce/features/homeScreen/domain/repositres/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeDs homeDs;

  HomeRepoImpl(this.homeDs);

  @override
  Future<Either<Failurs, BrandModel>> getBrands() async {
    try {
      var result = await homeDs.getBrands();
      return Right(result);
    } catch (e) {
      return left(RemoteFailurs(e.toString()));
    }
  }

  @override
  Future<Either<Failurs, CategoriesModel>> getCategories() async {
    try {
      var result = await homeDs.getCategories();
      return Right(result);
    } catch (e) {
      return left(RemoteFailurs(e.toString()));
    }
  }
}