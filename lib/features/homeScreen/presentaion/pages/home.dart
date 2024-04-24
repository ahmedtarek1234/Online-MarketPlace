import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/homeScreen/data/dataSource/remote/home_ds_impl.dart';
import 'package:e_commerce/features/homeScreen/data/repositry/home_repo_Impl.dart';
import 'package:e_commerce/features/homeScreen/domain/useCases/get_brands_usecase.dart';
import 'package:e_commerce/features/homeScreen/domain/useCases/get_categories_usecase.dart';
import 'package:e_commerce/features/homeScreen/presentaion/bloc/home_bloc.dart';
import 'package:e_commerce/features/homeScreen/presentaion/pages/Tabs/Home_tab.dart';
import 'package:e_commerce/features/homeScreen/presentaion/pages/Tabs/favourite_tab.dart';
import 'package:e_commerce/features/homeScreen/presentaion/pages/Tabs/products_tab.dart';
import 'package:e_commerce/features/homeScreen/presentaion/pages/Tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getBrandsUseCase: BrandsUseCase(
          HomeRepoImpl(
            HomeDsImpl(
              ApiManager(),
            ),
          ),
        ),
        getCategoriesUseCase: CategoriesUseCase(
          HomeRepoImpl(
            HomeDsImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(GetBrandsEvent())
      ..add(GetCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 83.w,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Online_MarketPlace",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            // BlocProvider.of<HomeBloc>(context).add(ChangeNavBar(value));
          },
          backgroundColor: AppColors.BackGround,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits_rounded),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF06004E),
                          ),
                          hintText: 'what do you search for?',
                          hintStyle: TextStyle(
                            color: Color(0x9906004E),
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30.0.sp,
                      color: Color(0xff004182),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(child: tabs[0]),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [HomeTab(), ProductsTab(), favouriteTab(), ProfileTab()];
}
