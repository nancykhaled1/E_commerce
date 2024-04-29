import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ui/auth/login/login.dart';
import '../../../utils/shared_preference.dart';
import '../../../utils/text_form_field.dart';

class ProfileTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/route.png',
                          color: MyTheme.primaryColor,
                        ),
                        IconButton(onPressed: (){
                          SharedPreferenceUtils.removeData('Token');
                          Navigator.pushReplacementNamed(context,
                              LoginScreen.routeName);
                        },
                            icon: Icon(Icons.logout))
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "WELCOME, MARIAM",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Mariam@gmail.com",
                      style: TextStyle(color: MyTheme.blackColor),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFormWidget(
                      fieldName: 'Your Full Name',
                      hintText: 'Mariam mahmoud hafez',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter full name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: (){},
                    ),
                    TextFormWidget(
                      fieldName: 'Your E-mail',
                      hintText: 'Mariam@gmail.com',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your email address';
                        }
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIconFunction: (){},
                    ),
                    TextFormWidget(
                      fieldName: 'Your Password',
                      hintText: '********',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 30) {
                          return 'password should be >6 & <30';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: (){},
                    ),
                    TextFormWidget(
                      fieldName: 'Your Mobile Number',
                      hintText: '01021212121',
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your mobile no';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: (){},
                    ),
                    TextFormWidget(
                      fieldName: 'Your Address',
                      hintText: 'Address',
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: (){},
                    ),


                  ],
                ),
              ),
            )),
      ),
    );
  }
}