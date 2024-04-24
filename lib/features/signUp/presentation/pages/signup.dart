import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/enums/screen_status.dart';
import 'package:e_commerce/features/signUp/data/dataSource/remote/signUp_Ds_Impl.dart';
import 'package:e_commerce/features/signUp/data/repositry/signUP_repo_impl.dart';
import 'package:e_commerce/features/signUp/domain/entity/signUp_Request_Model.dart';
import 'package:e_commerce/features/signUp/domain/repositry/SignUpRepo.dart';
import 'package:e_commerce/features/signUp/domain/usecases/signUp_useCase.dart';
import 'package:e_commerce/features/signUp/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        signUpUseCase(
          SignUpRepoImpl(
            signUpDsImpl(),
          ),
        ),
      ),
      child: BlocConsumer<SignUpBloc, SignUpState>(
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
                context, RoutesName.home, (route) => false);
          } else if (state.status == RequestStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failurs?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("SignUp "),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'User Name',
                          hintText: 'Enter Your User Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          labelText: 'phone',
                          hintText: 'Enter Your Phone'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                          hintText: 'Enter your password'),
                    ),
                  ),
                  SizedBox(
                    height: 130.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                      onPressed: () {
                        signUpRequestModel requestModel = signUpRequestModel(
                            name: "Ahmed",
                            email: "ahmedTarek@gamil.com",
                            phone: "01099461631",
                            password: "123456789",
                            rePassword: "123456789");
                        BlocProvider.of<SignUpBloc>(context)
                            .add(SignUpButtonEvent(requestModel));
                      },
                      child: Text(
                        'SignUP',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.login, (route) => false);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "I have an account ?",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.blue),
                          ),
                          TextSpan(
                            text: " Login",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
