import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_constants.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/data/model/response/CategoryDto.dart';
import 'package:e_commerce_project/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import '../model/request/signin.dart';
import '../model/request/signupRequest.dart';
import '../model/response/addProductToCartDto.dart';
import '../model/response/brandsDto.dart';
import '../model/response/getCartDto.dart';
import '../model/response/loginDto.dart';
import '../model/response/proddto.dart';
import '../model/response/registerResponseDto.dart';

class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager? getInstance(){
    _instance ?? ApiManager._();
    return _instance;
  }
  static Future<Either<Failures, RegisterResponseDto>> register(
      String name,
      String email,
      String password,
      String phone,
      ) async {
    try{
      final connectivityResult = await (Connectivity().checkConnectivity());
      print('response.body');


      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('response');

        Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.registerApi);
        print('ghjkgjgjfhjfhj');

        var requestBody = SignupRequest(
            email: email,
            password: password,
            phone: phone ,
          name: name
        );
        print(requestBody.toJson());
        var response = await http.post(url, body: requestBody.toJson());
        print('66666666666666');
        var RegisterResponse = RegisterResponseDto.fromJson(jsonDecode(response.body));
        print('7777gjg');
        if (response.statusCode >= 200 && response.statusCode < 300) {
          print('r55555555555555');

          return right(RegisterResponse);
        }
        else {
          print('999999999999999');
          return Left(Failures(errorMessage: RegisterResponse.message));
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



  static Future<Either<Failures, LoginDto>> login(
      String email,
      String password
      ) async {
   try{
    final connectivityResult = await (Connectivity().checkConnectivity());
    print('response.body');


      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        print('response');

        Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.loginApi);
        print('ghjkgjgjfhjfhj');

        var requestBody = SigninRequest(
            email: email??'',
            password: password??''
        );

        print(requestBody.toJson());
        var response = await http.post(url, body: requestBody.toJson());
        print("Response Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");

        print('66666666666666');

        var loginResponse = LoginDto.fromJson(jsonDecode(response.body));
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



  static Future<Either<Failures, CategoryResponseDto>> getCategory(int pageNum) async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.getCategoryApi,
        {
          'page' : '$pageNum'
        }
        );
        var response = await http.get(url);
        print(response.body);
        var categoryResponse = CategoryResponseDto.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return Right(categoryResponse);
        }
        else {
          return Left(ServerError(errorMessage: categoryResponse.message));
        }
      } else {
        return left(NetworkError(errorMessage: 'please check connection'));
      }
  }



  static Future<Either<Failures, BrandsResponseDto>> getBrands(int pageNum2) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.getBrandsApi,
          {
            'page' : '$pageNum2'
          }
      );
      var response = await http.get(url);
      print(response.body);
      var brandResponse = BrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandResponse);
      }
      else {
        return Left(ServerError(errorMessage: brandResponse.message));
      }
    } else {
      return left(NetworkError(errorMessage: 'please check connection'));
    }
  }


  static Future<Either<Failures, ProductsResponseDto>> getProducts(int pages) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.getProductApi,
      {
        'page' : '$pages',
      }
      );
      var response = await http.get(url);
      var productResponse = ProductsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      }
      else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      return left(NetworkError(errorMessage: 'please check connection'));
    }
  }




   static Future<Either<Failures, AddProductToCartDto >> addToCart(String productId) async {
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile ||
         connectivityResult == ConnectivityResult.wifi) {
       var token = SharedPreferenceUtils.getData(key: 'Token');
       Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.addToCart);
       var response = await http.post(url,
       body: {
         'product' : productId,
       },
         headers: {
         'token' : '$token'
           }
       );
       print(response.body);
       var addCartResponse = AddProductToCartDto.fromJson(jsonDecode(response.body));
       print('7777gjg');
       if (response.statusCode >= 200 && response.statusCode < 300) {
         print('right');
         return Right(addCartResponse);
       }
       else if(response.statusCode == 402){
         print('sucess');
         return Right(addCartResponse);
       }
       else if(response.statusCode == 401){
         print('error');
         return Left(Failures(errorMessage: addCartResponse.message));
       }
       else {
         print('errrrrrrrr');
         return Left(ServerError(errorMessage: addCartResponse.message));
       }
     } else {
       print('fffffffffffffff');
      return left(NetworkError(errorMessage: 'please check connection'));
     }

   }

  static Future<Either<Failures, GetCartDto >> getCart() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseurl2, ApiConstants.addToCart);
      var response = await http.get(url,
          headers: {
            'token' : '$token'
          }
      );
      print(response.body);
      var getCartResponse = GetCartDto.fromJson(jsonDecode(response.body));
      print('7777gjg');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('right');
        return Right(getCartResponse);
      }
      else if(response.statusCode == 401){
        print('error');
        return Left(Failures(errorMessage: getCartResponse.message));
      }
      else {
        print('errrrrrrrr');
        return Left(ServerError(errorMessage: getCartResponse.message));
      }
    } else {
      print('fffffffffffffff');
      return left(NetworkError(errorMessage: 'please check connection'));
    }

  }

}