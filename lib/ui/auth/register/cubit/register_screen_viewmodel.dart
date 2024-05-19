// RegisterScreenViewModel.dart

import 'package:e_commerce_project/ui/auth/register/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_project/domain/usecase/register_usecase.dart';

import '../../../../home/tabs/profile_tab/profile_tab.dart';
import '../../../../utils/shared_preference.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase,}) : super(RegisterInitialState());

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmationPasswordController = TextEditingController();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        phoneController.text,
      );
      either.fold(
            (failure) {
          emit(RegisterErrorState(errorMessage: failure.errorMessage));
        },
            (response) {
              SharedPreferenceUtils.init();
              SharedPreferenceUtils.saveData(key: 'name', value: nameController.text);
              SharedPreferenceUtils.saveData(key: 'email', value: emailController.text);
          emit(RegisterSuccessState(response: response));

        },
      );
    }
  }
}
