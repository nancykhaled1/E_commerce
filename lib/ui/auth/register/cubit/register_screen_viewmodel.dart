import 'package:e_commerce_project/ui/auth/register/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_project/domain/usecase/register_usecase.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}) : super (RegisterInitialState());


  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  TextEditingController confirmationPasswordController =
  TextEditingController();

  TextEditingController phoneController =
  TextEditingController();



  void register()async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      var either = await registerUseCase.invoke(nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      },
              (response) {
        emit(RegisterSuccessState(response: response));
              });
    }
  }
}