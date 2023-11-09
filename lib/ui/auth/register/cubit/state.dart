import 'package:e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:e_commerce_project/domain/entities/auth_result_Entity.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{
  String? loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
}
class RegisterErrorState extends RegisterStates{
  String? errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{
  AuthResultEntity response;
  RegisterSuccessState({required this.response});
}