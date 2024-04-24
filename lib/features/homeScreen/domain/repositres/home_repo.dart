import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';

abstract class HomeRepo{
  Future<Either<Failurs,BrandModel >>getBrands();
  Future<Either<Failurs,CategoriesModel >>getCategories();
}