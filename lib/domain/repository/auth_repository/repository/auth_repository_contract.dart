import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';

import '../../../entities/authEntity.dart';

abstract class AuthRepositoryContract{
   Future<Either<Failures,AuthEntity>> register(String name ,
      String email , String password , String phone);


   Future<Either<Failures,AuthEntity>> login(String email , String password);
}

