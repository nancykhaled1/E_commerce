import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_constants.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_project/data/model/response/CategoryOrBrandsResponseDto.dart';
import 'package:e_commerce_project/data/model/response/LoginResponse.dart';
import 'package:e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_project/data/model/response/addToCartDto.dart';
import 'package:e_commerce_project/data/model/response/productResponseDto.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';
import 'package:e_commerce_project/utils/shared_preference.dart';
import 'package:http/http.dart' as http;

import '../model/request/LoginRequest.dart';

class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager? getInstance(){
    _instance ?? ApiManager._();
    return _instance;
  }
   static Future<Either<Failures, RegisterResponse>> register(
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
        return Left(Failures(errorMessage: registerResponse.error != null ?
        registerResponse.error?.msg :
            registerResponse.message
        ));
      }
    } else {
      return left(Failures(errorMessage: 'please check connection'));
    }
  }



  static Future<Either<Failures, LoginResponse>> login(
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
          return Left(Failures(errorMessage: loginResponse.message));
        }
      } else {
        print('r77777777777777777');
        return left(Failures(errorMessage: 'please check connection'));
      }
    }catch (e){
     print(e.toString());
     throw e.toString();

   }




  }

  static Future<Either<Failures, CategoryOrBrandsResponseDto>> getCategory() async {

      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('response');

        Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.getCategoryApi);

        var response = await http.get(url);
        print('66666666666666');
        var categoryResponse = CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
        print('7777gjg');
        if (response.statusCode >= 200 && response.statusCode < 300) {
          print('r55555555555555');

          return Right(categoryResponse);
        }
        else {
          print('999999999999999');
          return Left(ServerError(errorMessage: categoryResponse.message));
        }
      } else {
        print('r77777777777777777');
        return left(NetworkError(errorMessage: 'please check connection'));
      }





  }
  static Future<Either<Failures, CategoryOrBrandsResponseDto>> getBrands() async {

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print('response');

      Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.getBrandsApi);

      var response = await http.get(url);
      print('66666666666666');
      var brandResponse = CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      print('7777gjg');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('r55555555555555');

        return Right(brandResponse);
      }
      else {
        print('999999999999999');
        return Left(ServerError(errorMessage: brandResponse.message));
      }
    } else {
      print('r77777777777777777');
      return left(NetworkError(errorMessage: 'please check connection'));
    }





  }
  static Future<Either<Failures, ProductResponseDto>> getProducts() async {

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print('response');

      Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.getProductApi);

      var response = await http.get(url);
      print('66666666666666');
      var productResponse = ProductResponseDto.fromJson(jsonDecode(response.body));
      print('7777gjg');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('r55555555555555');

        return Right(productResponse);
      }
      else {
        print('999999999999999');
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      print('r77777777777777777');
      return left(NetworkError(errorMessage: 'please check connection'));
    }





  }

  static Future<Either<Failures, AddToCartResponseEntity >> addToCart(String productId) async {

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print('response');
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.addToCart);

      var response = await http.post(url,
      body: {
        'productId' : productId,
      },
      headers: {
        'token' : token!
          }
      );
      print('66666666666666');
      var addCartResponse = AddToCartDto.fromJson(jsonDecode(response.body));
      print('7777gjg');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('r55555555555555');

        return Right(addCartResponse);
      }
      else if(response.statusCode == 401){
        return Left(Failures(errorMessage: addCartResponse.message));
      }
      else {
        print('999999999999999');
        return Left(ServerError(errorMessage: addCartResponse.message));
      }
    } else {
      print('r77777777777777777');
      return left(NetworkError(errorMessage: 'please check connection'));
    }





  }

}