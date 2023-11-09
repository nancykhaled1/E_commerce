import 'package:e_commerce_project/domain/usecase/register_usecase.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/register_screen_viewmodel.dart';
import 'package:e_commerce_project/ui/auth/register/cubit/state.dart';
import 'package:e_commerce_project/utils/dialog_utils.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          DialogUtils.showMessage(context, state.errorMessage!, title: 'Error');
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
                    padding: EdgeInsets.only(
                      bottom: 5,left: 20,right: 20
                    ),
                    child: TextFormWidget(
                      fieldName: 'Full Name',
                      hintText: 'enter your full name',
                      controller: viewModel.nameController,
                      validator: (text) {
                        if (text!.isEmpty || text.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5,bottom: 5,left: 20,right: 20
                    ),
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
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5,bottom: 5,left: 20,right: 20
                    ),
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
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5,bottom: 5,left: 20,right: 20
                    ),
                    child: TextFormWidget(
                      fieldName: 'Confirmation Password',
                      hintText: 'enter your confirmation password ',
                      isobscure: true,
                      keyboardType: TextInputType.number,
                      controller: viewModel.confirmationPasswordController,
                      validator: (text) {
                        if (text!.isEmpty || text.trim().isEmpty) {
                          return 'Please enter confirmation password';
                        }
                        if (text != viewModel.passwordController.text) {
                          return 'password doesnot match ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5,bottom: 5,left: 20,right: 20
                    ),
                    child: TextFormWidget(
                      fieldName: 'Mobile Number',
                      hintText: 'enter your mobile no. ',
                      keyboardType: TextInputType.number,
                      controller: viewModel.phoneController,
                      validator: (text) {
                        if (text!.isEmpty || text.trim().isEmpty) {
                          return 'Please enter mobil no.';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 35.h, left: 30.w, right: 30.w, bottom: 35.h),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.register();
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
                            'Sign Up',
                            style: TextStyle(color: Colors.black),
                          ))),
                    ),
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
