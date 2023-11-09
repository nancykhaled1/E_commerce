import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_constants.dart';
import 'package:e_commerce_project/data/api/base_error.dart';
import 'package:e_commerce_project/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_project/data/model/response/LoginResponse.dart';
import 'package:e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

import '../model/request/LoginRequest.dart';

class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager? getInstance(){
    _instance ?? ApiManager._();
    return _instance;
  }
   static Future<Either<BaseError, RegisterResponse>> register(
      String name,
      String email,
      String password,
      String confirmationPassword,
      String phone,
      ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: confirmationPassword,
        phone: phone,
      );
      var response = await http.post(url, body: requestBody.toJson());
      print(response.body);
      var registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(registerResponse);
      }
      else {
        return Left(BaseError(errorMessage: registerResponse.error != null ?
        registerResponse.error?.msg :
            registerResponse.message
        ));
      }
    } else {
      return left(BaseError(errorMessage: 'please check connection'));
    }
  }



  static Future<Either<BaseError, LoginResponse>> login(
      String email,
      String password
      ) async {
   try{
    final connectivityResult = await (Connectivity().checkConnectivity());
    print('response.body');


      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('response');

        Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.loginApi);
        print('ghjkgjgjfhjfhj');

        var requestBody = LoginRequest(
            email: email??'',
            password: password??''
        );
        print(requestBody.toJson());
        var response = await http.post(url, body: requestBody.toJson());
        print('66666666666666');
        var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        print('7777gjg');
        if (response.statusCode >= 200 && response.statusCode < 300) {
          print('r55555555555555');

          return right(loginResponse);
        }
        else {
          print('999999999999999');
          return Left(BaseError(errorMessage: loginResponse.message));
        }
      } else {
        print('r77777777777777777');
        return left(BaseError(errorMessage: 'please check connection'));
      }
    }catch (e){
     print(e.toString());
     throw e.toString();

   }




  }
}