import 'package:dartz/dartz.dart';

import '../../../../data/api/failures.dart';
import '../../../entities/authEntity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,AuthEntity>> register(String name ,
      String email , String password  , String phone);

  Future<Either<Failures,AuthEntity>> login(String email , String password);

}