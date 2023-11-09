import 'package:e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_project/domain/entities/auth_result_Entity.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{
  String? loadingMessage;
  LoginLoadingState({required this.loadingMessage});
}
class LoginErrorState extends LoginStates{
  String? errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginStates{
  AuthResultEntity response;
  LoginSuccessState({required this.response});
}