
import '../../../../domain/entities/authEntity.dart';

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
  AuthEntity response;
  LoginSuccessState({required this.response});
}