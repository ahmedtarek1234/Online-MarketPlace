import 'package:bloc/bloc.dart';
import 'package:e_commerce_c10_monday/core/enums/enums.dart';
import 'package:e_commerce_c10_monday/core/errors/failuers.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_c10_monday/features/home/data/models/ProductModel.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_brands_useCase.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_card_iteams.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_categories_useCase.dart';
import 'package:e_commerce_c10_monday/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBrandsUseCase getBrandsUseCase;
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  addToCartUseCase AddToCartUseCase;
  GetCartIteamsUseCase getCartIteamsUseCase;

  HomeBloc(
      {required this.getBrandsUseCase,
      required this.getProductsUseCase,
      required this.getCategoriesUseCase,
      required this.AddToCartUseCase,
      required this.getCartIteamsUseCase})
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
            getCategoriesStatus: RequestStatus.failure, categoryFailure: l));
      }, (r) {
        emit(state.copyWith(
            getCategoriesStatus: RequestStatus.success, categoryModel: r));
      });
    });

    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: RequestStatus.loading));
      var result = await getProductsUseCase();

      result.fold((l) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.failure, productFailure: l));
      }, (r) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.success, productModel: r));
      });
    });
    on<ChangeNavBar>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
    on<AddToCartEvent>((event, emit) async {
      emit(state.copyWith(addToCart: RequestStatus.loading));
      var result = await AddToCartUseCase(event.productId);
      result.fold((l) {
        emit(state.copyWith(addToCart: RequestStatus.failure));
      }, (r) {
        emit(state.copyWith(addToCart: RequestStatus.success));
      });
    });
    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(getCartIteamStatus: RequestStatus.loading));
      var result = await getCartIteamsUseCase();
      result.fold((l) {
        emit(state.copyWith(getCartIteamStatus: RequestStatus.failure));
      }, (r) {
        emit(state.copyWith(
            getCartIteamStatus: RequestStatus.success, cartIteams: r));
      });
    });
  }
}
