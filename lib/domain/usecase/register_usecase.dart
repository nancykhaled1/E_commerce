import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce_project/repository/auth_repository/repository/auth_reposiyory_imp.dart';

import '../../data/api/failures.dart';
import '../entities/auth_result_Entity.dart';

class RegisterUseCase{
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});

 Future<Either<Failures,AuthResultEntity>>invoke(String name ,
     String email , String password , String confirmationPassword , String phone)
 async{
   var either = await repositoryContract.register(name, email, password, confirmationPassword, phone);
   return either.fold((l)  {
     return Left(Failures(errorMessage: l.errorMessage));
   },
           (response)  {
         return Right(response);
       });
 }
 }

