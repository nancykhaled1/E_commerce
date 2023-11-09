import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_manager.dart';
import 'package:e_commerce_project/data/api/base_error.dart';
import 'package:e_commerce_project/domain/entities/auth_result_Entity.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/auth_remote_datasource.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  ApiManager? apiManager;
  AuthRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<BaseError,AuthResultEntity>> register(String name, String email, String password, String confirmationPassword, String phone)
  async{
    var either = await ApiManager.register(name, email, password, confirmationPassword, phone);
     return either.fold((l)  {
      return Left(BaseError(errorMessage: l.errorMessage));
    },
            (response)  {
        return Right(response.toAuthResultEntity());
            });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) async{
    var either = await ApiManager.login(email, password);
    return either.fold((l)  {
      return Left(BaseError(errorMessage: l.errorMessage));
    },
            (response)  {
          return Right(response.toAuthResultEntity());
        });
  }


}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager: ApiManager.getInstance());
}