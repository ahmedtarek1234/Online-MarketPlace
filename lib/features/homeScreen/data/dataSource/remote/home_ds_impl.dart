import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/features/homeScreen/data/dataSource/remote/home_ds.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';

class HomeDsImpl implements HomeDs{
  ApiManager apiManager;
  HomeDsImpl(this.apiManager);
  @override
  Future<BrandModel> getBrands()async {

    var response =await apiManager.getData(endPoint: EndPoints.Brands);
    BrandModel brandModel =BrandModel.fromJson(response.data);
    return brandModel;
  }

  @override
  Future<CategoriesModel> getCategories()async {
    var response =await apiManager.getData(endPoint: EndPoints.categories);
    CategoriesModel categoriesModel =CategoriesModel.fromJson(response.data);
    return categoriesModel;
  }

}