import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/auth_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../data/api/base_error.dart';
import '../../../domain/entities/auth_result_Entity.dart';
import '../data_source/auth_remote_datasource_imp.dart';

class AuthRepositoryImp implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<BaseError,AuthResultEntity>> register(String name, String email, String password, String confirmationPassword, String phone) {
    return remoteDataSource.register(name, email, password, confirmationPassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }




}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImp(remoteDataSource: injectAuthRemoteDataSource());
}