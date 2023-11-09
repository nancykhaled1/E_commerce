import 'dart:io';

import 'package:e_commerce_project/ui/auth/login/login.dart';
import 'package:e_commerce_project/ui/auth/register/register.dart';
import 'package:e_commerce_project/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            SplashScreen.routeName : (context) => SplashScreen(),
            RegisterScreen.routeName : (context) => RegisterScreen(),
            LoginScreen.routeName : (context) => LoginScreen()
          },
        );
      },
    );

  }
}


