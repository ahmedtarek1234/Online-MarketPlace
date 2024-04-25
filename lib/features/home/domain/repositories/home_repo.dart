import 'package:dartz/dartz.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductModel.dart';

abstract class HomeRepo {
  Future<Either<Failures, BrandModel>> getBrands();
  Future<Either<Failures, CategoryModel>> getCategories();
  Future<Either<Failures, ProductModel>> getProducts();
}
