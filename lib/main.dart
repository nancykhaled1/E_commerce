import 'dart:io';
import 'package:e_commerce_project/home/cart/cartscreen.dart';
import 'package:e_commerce_project/home/home_screen/home_screen.dart';
import 'package:e_commerce_project/home/tabs/product_tab/product_details/product_details.dart';
import 'package:e_commerce_project/home/tabs/profile_tab/profile_tab.dart';
import 'package:e_commerce_project/ui/auth/login/login.dart';
import 'package:e_commerce_project/ui/auth/register/register.dart';
import 'package:e_commerce_project/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();

  HttpOverrides.global = MyHttpOverrides();

  String route;
  var user = SharedPreferenceUtils.getData(key: 'Token');
  if(user == null){
    route = LoginScreen.routeName;
  }else{
    route = HomeScreen.routeName;
  }
  runApp(MyApp(route));
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  String route;
   MyApp(this.route);

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
          initialRoute: route,
          routes: {
           // SplashScreen.routeName : (context) => SplashScreen(),
            RegisterScreen.routeName : (context) => RegisterScreen(),
            LoginScreen.routeName : (context) => LoginScreen(),
            HomeScreen.routeName : (context) => HomeScreen(),
            ProductDetails.routeName : (context) => ProductDetails(),
            CartScreen.routNam :(context) => CartScreen(),
            ProfileTab.routeName : (context) => ProfileTab()
          },
        );
      },
    );

  }
}


