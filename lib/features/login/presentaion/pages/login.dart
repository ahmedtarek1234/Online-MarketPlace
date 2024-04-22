import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/enums/screen_status.dart';
import 'package:e_commerce/features/login/data/dataSource/remote/remote_login_ds_impl.dart';
import 'package:e_commerce/features/login/data/repositry/login_repo_impl.dart';
import 'package:e_commerce/features/login/domain/usecases/login_useCase.dart';
import 'package:e_commerce/features/login/presentaion/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class logiScreen extends StatelessWidget {
  logiScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase(
          loginRepoImpl(
            RemoteLoginDsImpl(),
          ),
        ),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }else if(state.status==ScreenStatus.success){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
          }else if(state.status==ScreenStatus.failure){
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failurs?.message??""),
              ),
            );

          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Login Page"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 30, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                          hintText: 'Enter your password'),
                    ),
                  ),
                  SizedBox(height: 130.h,),
                  Container(
                    height: 50.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(
                            LoginButtonEvent(
                                "ahmedmutti@gmail.com", "Ahmed@123"));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text('New User? Create Account')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
