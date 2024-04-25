import 'package:e_commerce_c10_monday/config.dart';
import 'package:e_commerce_c10_monday/config/routes/app_router.dart';
import 'package:e_commerce_c10_monday/core/enums/enums.dart';
import 'package:e_commerce_c10_monday/core/utils/app_colors.dart';
import 'package:e_commerce_c10_monday/features/login/data/datasources/remote/login_remote_ds_impl.dart';
import 'package:e_commerce_c10_monday/features/login/data/repository/login_repo_impl.dart';
import 'package:e_commerce_c10_monday/features/login/domain/usecases/login_use_case.dart';
import 'package:e_commerce_c10_monday/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/reuseable_components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == RequestStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state.status == RequestStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutesName.home, (route) => false);
          } else if (state.status == RequestStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.BackGround,
            body: Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  routeField(
                      controller: emailController,
                      label: "Email",
                      radius: 16,
                      setBackgroundColor: true),
                  SizedBox(
                    height: 18.h,
                  ),
                  routeField(
                      controller: passwordController,
                      label: "Password",
                      radius: 16,
                      setBackgroundColor: true),
                  SizedBox(
                    height: 18.h,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonEvent(
                                    "ahmedmutti@gmail.com", "Ahmed@123"));
                          },
                          child: const Text("Login"))),
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutesName.signUp);
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Don't have an account ?",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white)),
                              TextSpan(
                                  text: " " + 'Create Account',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
