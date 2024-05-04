part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init) RequestStatus getBrandsStatus,
    @Default(RequestStatus.init) RequestStatus getProductsStatus,
    @Default(RequestStatus.init) RequestStatus getCategoriesStatus,
    @Default(RequestStatus.init) RequestStatus addToCart,
    @Default(RequestStatus.init) RequestStatus getCartIteamStatus,
    BrandModel? brandModel,
    @Default(0) int currentIndex,
    @Default(0) int cartIteams,
    CategoryModel? categoryModel,
    ProductModel? productModel,
    Failures? brandFailure,
    Failures? categoryFailure,
    Failures? productFailure,
  }) = _HomeState;
}
