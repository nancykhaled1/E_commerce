import 'package:e_commerce_project/domain/entities/authEntity.dart';
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
import '../../../domain/entities/UserEntity.dart';
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
          DialogUtils.showMessage(
              context,
              'Login successful!',
              title: 'Success',
              posActionName: 'OK',
              posAction: () {
                //  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                /// save token
                SharedPreferenceUtils.saveData(key: 'Token', value: state.response.token);

                Navigator.of(context).pushNamed(HomeScreen.routeName);
              }
          );
        }
        if (state is LoginLoadingState) {
          DialogUtils.showMessage(
              context,
              state.loadingMessage!,
              negActionName: 'cancel',
              negAction: (){},
              title: 'Wait');
        }
      },
      child: Scaffold(
          body: Container(
              color: MyTheme.whiteColor,
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Form(
                      key: viewModel.formKey,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 70,
                              left: 70,
                              right: 70
                          ),
                          child: Image.asset('assets/images/E-Shop.png'),
                        ),
                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 70),
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 60,
                                        bottom: 30
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Welcome Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'you have been missed',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),

                                        TextFormWidget(
                                          hintText: 'E-mail',
                                          controller: viewModel.emailController,
                                          keyboardType: TextInputType.text,
                                          validator: (text) {
                                            if (text!.isEmpty ||
                                                text.trim().isEmpty) {
                                              return 'Please enter Email';
                                            }
                                            bool emailValid = RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(text);
                                            if (!emailValid) {
                                              return 'Please enter a valid email';
                                            }

                                            return null;
                                          },

                                        ),
                                        TextFormWidget(
                                          hintText: 'Password',
                                          isobscure: true,
                                          keyboardType: TextInputType.number,
                                          controller: viewModel.passwordController,
                                          validator: (text) {
                                            if (text!.isEmpty ||
                                                text.trim().isEmpty) {
                                              return 'Please enter Password';
                                            }
                                            if (text.length < 6) {
                                              return 'Password should be at least 6 char';
                                            }
                                            return null;
                                          },

                                          // suffixIcon: GestureDetector( // Wrap Icon with GestureDetector to handle tap events
                                          //   onTap: () {
                                          //     // Handle suffix icon tap event here
                                          //   },
                                          //   child: Icon(
                                          //     Icons.visibility_off,
                                          //     color: Colors.grey, // Change color of the icon as needed
                                          //   ),
                                          // ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                        Checkbox(
                                          activeColor: MyTheme.primaryColor,
                                        value: viewModel.isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              viewModel.isChecked = value!;
                                            });
                                          },
                                        ),
                                            Text('Remember me',
                                            style: TextStyle(
                                              color: Colors.grey
                                            ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: (){
                                                Navigator.of(context).pushNamed(LoginScreen.routeName);
                                              },
                                              child: Text('Forget Password?',
                                                style: TextStyle(
                                                  //  decoration: TextDecoration.underline,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: MyTheme.primaryColor
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Padding(
                                            padding: EdgeInsets.only(
                                              // top: 35.h,
                                              left: 40.w,
                                              right: 40.w,
                                              // bottom: 35.h
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (viewModel.formKey.currentState!.validate()) {
                                                    viewModel.login();

                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  // maximumSize: Size(double.infinity,30),

                                                    backgroundColor:
                                                    MyTheme.primaryColor,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadiusDirectional
                                                            .all(Radius.circular(
                                                            10.r)))),
                                                child: SizedBox(
                                                    height: 40.h,
                                                    //  width: 398.w,
                                                    child: Center(
                                                        child: Text(
                                                          'Login',
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ))))),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Dont have an account?',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: (){
                                                Navigator.of(context).pushNamed(RegisterScreen.routeName);
                                              },
                                              child: Text('sign up',
                                                style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: MyTheme.primaryColor
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 45, // Adjust the position of the image horizontally
                                //  top: 10,
                                bottom: 450,
                                child: Image.asset('assets/images/Group 56.png',
                                  width: 220,
                                  height: 240,
                                )),
                          ],
                        )
                      ])))))
    );
  }
}
// Scaffold(
// body: Container(
// color: MyTheme.primaryColor,
// height: double.infinity,
// child: SingleChildScrollView(
// child: Form(
// key: viewModel.formKey,
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.only(
// top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
// child: Image.asset('assets/images/route.png'),
// ),
// Padding(
// padding:
// EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
// child: TextFormWidget(
//
// hintText: 'enter your email',
// controller: viewModel.emailController,
// keyboardType: TextInputType.phone,
// validator: (text) {
// if (text!.isEmpty || text.trim().isEmpty) {
// return 'Please enter Email';
// }
// bool emailValid = RegExp(
// r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//     .hasMatch(text);
// if (!emailValid) {
// return 'Please enter a valid email';
// }
//
// return null;
// }, suffixIconFunction: () {  },
// ),
// ),
// Padding(
// padding:
// EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
// child: TextFormWidget(
//
// hintText: 'enter your password',
// isobscure: true,
// keyboardType: TextInputType.number,
// controller: viewModel.passwordController,
// validator: (text) {
// if (text!.isEmpty || text.trim().isEmpty) {
// return 'Please enter Password';
// }
// if (text.length < 6) {
// return 'Password should be at least 6 char';
// }
// return null;
// }, suffixIconFunction: () {  },
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 35.h, left: 30.w, right: 30.w, bottom: 35.h),
// child: ElevatedButton(
// onPressed: () {
// viewModel.login();
// },
// style: ElevatedButton.styleFrom(
// backgroundColor: MyTheme.whiteColor,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadiusDirectional.all(
// Radius.circular(35.r)))),
// child: SizedBox(
// height: 64.h,
// width: 398.w,
// child: Center(
// child: Text(
// 'Login',
// style: TextStyle(color: Colors.black),
// ))),
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Already have an account?',
// style: Theme.of(context).textTheme.titleMedium!.copyWith(
// color: MyTheme.whiteColor
// )
// ),
// TextButton(
// onPressed: () {
// Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
// },
// child: Text('Sign Up',
// style: Theme.of(context).textTheme.titleMedium!.copyWith(
// color: MyTheme.whiteColor
// )
// ),
// )
// ],
// )
// ],
// ),
// ),
// ),
// ),
// ),