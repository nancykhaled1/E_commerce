import 'package:e_commerce_project/domain/usecase/login_usecase.dart';
import 'package:e_commerce_project/domain/usecase/register_usecase.dart';
import 'package:e_commerce_project/home/home_screen/home_screen.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/register_screen_viewmodel.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/state.dart';
import 'package:e_commerce_project/ui/auth/register/register.dart';
import 'package:e_commerce_project/utils/dialog_utils.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:e_commerce_project/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/di.dart';
import '../../../utils/text_form_field.dart';
import 'cubit/login_screen_viewmodel.dart';
import 'cubit/state.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var viewModel = LoginScreenViewModel(loginUseCase: injectLoginUseCase());
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!, title: 'Error');
        }
        if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.token!,
              title: 'Success');
          /// save token
          SharedPreferenceUtils.saveData(key: 'Token', value: state.response.token);
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
        if (state is LoginLoadingState) {
          DialogUtils.showMessage(context, state.loadingMessage!,
              title: 'Wait');
        }
      },
      child: Scaffold(
        body: Container(
          color: MyTheme.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                    child: Image.asset('assets/images/route.png'),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormWidget(
                      fieldName: 'Email',
                      hintText: 'enter your email',
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text!.isEmpty || text.trim().isEmpty) {
                          return 'Please enter Email';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      }, suffixIconFunction: () {  },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    child: TextFormWidget(
                      fieldName: 'Password',
                      hintText: 'enter your password',
                      isobscure: true,
                      keyboardType: TextInputType.number,
                      controller: viewModel.passwordController,
                      validator: (text) {
                        if (text!.isEmpty || text.trim().isEmpty) {
                          return 'Please enter Password';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 char';
                        }
                        return null;
                      }, suffixIconFunction: () {  },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 35.h, left: 30.w, right: 30.w, bottom: 35.h),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(35.r)))),
                      child: SizedBox(
                          height: 64.h,
                          width: 398.w,
                          child: Center(
                              child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.whiteColor
                      )
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: MyTheme.whiteColor
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
