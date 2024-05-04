// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'features/home/data/data_sources/home_ds.dart' as _i4;
import 'features/home/data/data_sources/home_ds_impl.dart' as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i7;
import 'features/home/domain/repositories/home_repo.dart' as _i6;
import 'features/home/domain/use_cases/add_to_cart_usecase.dart' as _i13;
import 'features/home/domain/use_cases/get_brands_useCase.dart' as _i14;
import 'features/home/domain/use_cases/get_card_iteams.dart' as _i15;
import 'features/home/domain/use_cases/get_categories_useCase.dart' as _i16;
import 'features/home/domain/use_cases/get_products_usecase.dart' as _i17;
import 'features/home/presentation/bloc/home_bloc.dart' as _i18;
import 'features/login/data/datasources/remote/login_ds.dart' as _i8;
import 'features/login/data/datasources/remote/login_remote_ds_impl.dart'
    as _i9;
import 'features/login/data/repository/login_repo_impl.dart' as _i11;
import 'features/login/domain/repository/login_repo.dart' as _i10;
import 'features/login/domain/usecases/login_use_case.dart' as _i12;
import 'features/login/presentation/bloc/login_bloc.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.HomeDS>(() => _i5.HomeDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(gh<_i4.HomeDS>()));
    gh.factory<_i8.LoginRemoteDS>(() => _i9.LoginRemoteDSImpl());
    gh.factory<_i10.LoginRepo>(
        () => _i11.LoginRepoImpl(gh<_i8.LoginRemoteDS>()));
    gh.factory<_i12.LoginUseCase>(
        () => _i12.LoginUseCase(gh<_i10.LoginRepo>()));
    gh.factory<_i13.addToCartUseCase>(
        () => _i13.addToCartUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i14.GetBrandsUseCase>(
        () => _i14.GetBrandsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i15.GetCartIteamsUseCase>(
        () => _i15.GetCartIteamsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i16.GetCategoriesUseCase>(
        () => _i16.GetCategoriesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i17.GetProductsUseCase>(
        () => _i17.GetProductsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i18.HomeBloc>(() => _i18.HomeBloc(
          getBrandsUseCase: gh<_i14.GetBrandsUseCase>(),
          getProductsUseCase: gh<_i17.GetProductsUseCase>(),
          getCategoriesUseCase: gh<_i16.GetCategoriesUseCase>(),
          AddToCartUseCase: gh<_i13.addToCartUseCase>(),
          getCartIteamsUseCase: gh<_i15.GetCartIteamsUseCase>(),
        ));
    gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(gh<_i12.LoginUseCase>()));
    return this;
  }
}
