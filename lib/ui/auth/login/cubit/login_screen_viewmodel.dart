import 'package:e_commerce_project/domain/usecase/login_usecase.dart';
import 'package:e_commerce_project/ui/auth/login/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;
  LoginScreenViewModel({required this.loginUseCase}) : super (LoginInitialState());
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();
  bool isChecked = false;
  bool ispass = true;

  void login()async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUseCase.invoke(emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      },
              (response) {
            emit(LoginSuccessState(response: response));
          });
    }
  }
}