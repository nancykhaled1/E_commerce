import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/base_error.dart';

import '../../../../data/model/response/RegisterResponse.dart';
import '../../../entities/auth_result_Entity.dart';

abstract class AuthRepositoryContract{
   Future<Either<BaseError,AuthResultEntity>> register(String name ,
      String email , String password , String confirmationPassword , String phone);


   Future<Either<BaseError,AuthResultEntity>> login(String email , String password);
}