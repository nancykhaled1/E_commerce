import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/auth_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../data/api/failures.dart';
import '../../../domain/entities/authEntity.dart';


class AuthRepositoryImp implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failures,AuthEntity>> register(String name, String email, String password,  String phone) {
    return remoteDataSource.register(name, email, password, phone);
  }

  @override
  Future<Either<Failures, AuthEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }




}
