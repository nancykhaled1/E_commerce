
import '../../../../domain/entities/authEntity.dart';

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
  AuthEntity response;
  RegisterSuccessState({required this.response});
}


// TextFormWidget(
//   hintText: 'Confirm Password ',
//   isobscure: true,
//   keyboardType: TextInputType.number,
//   controller: viewModel
//       .confirmationPasswordController,
//   validator: (text) {
//     if (text!.isEmpty ||
//         text.trim().isEmpty) {
//       return 'Please enter confirmation password';
//     }
//     if (text !=
//         viewModel.passwordController.text) {
//       return 'password doesnot match ';
//     }
//     return null;
//   },
//   suffixIconFunction: () {},
// ),