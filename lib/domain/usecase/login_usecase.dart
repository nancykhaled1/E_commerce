import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce_project/repository/auth_repository/repository/auth_reposiyory_imp.dart';

import '../../data/api/base_error.dart';
import '../entities/auth_result_Entity.dart';

class LoginUseCase{
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});

  Future<Either<BaseError,AuthResultEntity>>invoke(String email , String password )
  async{
    var either = await repositoryContract.login(email, password);
    return either.fold((l)  {
      return Left(BaseError(errorMessage: l.errorMessage));
    },
            (response)  {
          return Right(response);
        });
  }
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepository());
}