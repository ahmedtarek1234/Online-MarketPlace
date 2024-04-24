import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/enums/screen_status.dart';
import 'package:e_commerce/core/error/faliurs.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Brands.dart';
import 'package:e_commerce/features/homeScreen/data/models/Get_All_Catrgories.dart';
import 'package:e_commerce/features/homeScreen/domain/useCases/get_brands_usecase.dart';
import 'package:e_commerce/features/homeScreen/domain/useCases/get_categories_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BrandsUseCase getBrandsUseCase;
  CategoriesUseCase getCategoriesUseCase;

  HomeBloc({required this.getBrandsUseCase, required this.getCategoriesUseCase})
      : super(const HomeState()) {
    on<GetBrandsEvent>((event, emit) async {
      emit(state.copyWith(getBrandsStatus: RequestStatus.loading));

      var result = await getBrandsUseCase();
      result.fold((l) {
        emit(state.copyWith(
            getBrandsStatus: RequestStatus.failure, brandFailure: l));
      }, (r) {
        emit(state.copyWith(
            getBrandsStatus: RequestStatus.success, brandModel: r));
      });
    });
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesStatus: RequestStatus.loading));

      var result = await getCategoriesUseCase();
      result.fold((l) {
        emit(state.copyWith(
            getCategoriesStatus: RequestStatus.failure, categorieFailure: l));
      }, (r) {
        emit(state.copyWith(
            getCategoriesStatus: RequestStatus.success, categoriesModel: r));
      });
    });
  }
}
