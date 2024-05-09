import 'package:e_commerce_project/home/home_screen/home_screen.dart';
import 'package:e_commerce_project/ui/auth/login/login.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/register_screen_viewmodel.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/state.dart';
import 'package:e_commerce_project/utils/dialog_utils.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/di.dart';
import '../../../utils/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                title: 'Error');
          }
          if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context, state.response.userEntity?.name ?? '',
                title: 'Success');
          }
          if (state is RegisterLoadingState) {
            DialogUtils.showMessage(context, state.loadingMessage!,
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
                                            'Register',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Its nice to meet you',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormWidget(
                                            hintText: 'Full Name',

                                            controller: viewModel.nameController,
                                            validator: (text) {
                                              if (text!.isEmpty ||
                                                  text.trim().isEmpty) {
                                                return 'Please enter your full name';
                                              }
                                              return null;
                                            },
                                            suffixIconFunction: () {},
                                          ),
                                          TextFormWidget(
                                            hintText: 'Number',
                                            controller: viewModel.phoneController,
                                            validator: (text) {
                                              if (text!.isEmpty ||
                                                  text.trim().isEmpty) {
                                                return 'Please enter mobil no.';
                                              }

                                              return null;
                                            },
                                            suffixIconFunction: () {},
                                          ),
                                          TextFormWidget(
                                            hintText: 'Email',
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
                                            suffixIconFunction: () {},
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
                                            suffixIconFunction: () {},
                                          ),
                                          TextFormWidget(
                                            hintText: 'Confirm Password ',
                                            isobscure: true,
                                            keyboardType: TextInputType.number,
                                            controller: viewModel
                                                .confirmationPasswordController,
                                            validator: (text) {
                                              if (text!.isEmpty ||
                                                  text.trim().isEmpty) {
                                                return 'Please enter confirmation password';
                                              }
                                              if (text !=
                                                  viewModel.passwordController.text) {
                                                return 'password doesnot match ';
                                              }
                                              return null;
                                            },
                                            suffixIconFunction: () {},
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
                                                    viewModel.register();
                                                    Navigator.pushNamed(
                                                        context, HomeScreen.routeName);
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
                                                            'Sign Up',
                                                            style: TextStyle(
                                                                color: Colors.white),
                                                          ))))),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('already have an account?',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: (){
                                                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                                                },
                                                child: Text('sign in',
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
                                  bottom: 600,
                                  child: Image.asset('assets/images/Group 56.png',
                                  width: 220,
                                    height: 210,
                                  )),
                            ],
                          )
                        ])))))
    );
  }
}

//
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
// padding: EdgeInsets.only(
// bottom: 5,left: 20,right: 20
// ),
// child: TextFormWidget(
// fieldName: 'Full Name',
// hintText: 'enter your full name',
// controller: viewModel.nameController,
// validator: (text) {
// if (text!.isEmpty || text.trim().isEmpty) {
// return 'Please enter your full name';
// }
// return null;
// }, suffixIconFunction: () {  },
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 5,bottom: 5,left: 20,right: 20
// ),
// child: TextFormWidget(
// fieldName: 'Email',
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
// padding: EdgeInsets.only(
// top: 5,bottom: 5,left: 20,right: 20
// ),
// child: TextFormWidget(
// fieldName: 'Password',
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
// top: 5,bottom: 5,left: 20,right: 20
// ),
// child: TextFormWidget(
// fieldName: 'Confirmation Password',
// hintText: 'enter your confirmation password ',
// isobscure: true,
// keyboardType: TextInputType.number,
// controller: viewModel.confirmationPasswordController,
// validator: (text) {
// if (text!.isEmpty || text.trim().isEmpty) {
// return 'Please enter confirmation password';
// }
// if (text != viewModel.passwordController.text) {
// return 'password doesnot match ';
// }
// return null;
// }, suffixIconFunction: () {  },
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 5,bottom: 5,left: 20,right: 20
// ),
// child: TextFormWidget(
// fieldName: 'Mobile Number',
// hintText: 'enter your mobile no. ',
// keyboardType: TextInputType.number,
// controller: viewModel.phoneController,
// validator: (text) {
// if (text!.isEmpty || text.trim().isEmpty) {
// return 'Please enter mobil no.';
// }
//
// return null;
// }, suffixIconFunction: () {  },
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// top: 35.h, left: 30.w, right: 30.w, bottom: 35.h),
// child: ElevatedButton(
// onPressed: () {
// viewModel.register();
// Navigator.pushNamed(context, HomeScreen.routeName);
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
// 'Sign Up',
// style: TextStyle(color: Colors.black),
// ))),
// ),
// )
// ],
// ),
// ),
// ),
// ),
// ),
