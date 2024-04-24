part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init)RequestStatus getBrandsStatus,
    @Default(RequestStatus.init)RequestStatus getCategoriesStatus,
    BrandModel ?brandModel,
    CategoriesModel? categoriesModel,
    Failurs? brandFailure,
    Failurs? categorieFailure,



}) = _HomeState;
}
