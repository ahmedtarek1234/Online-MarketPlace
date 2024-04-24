import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';

abstract class HomeDs{
Future<BrandModel>getBrands();
Future<CategoriesModel>getCategories();
}