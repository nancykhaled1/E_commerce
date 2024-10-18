import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/getCartResponseEntity.dart';
import '../../../domain/usecase/get_cart_usecase.dart';
import 'cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates>{
  GetCartUseCase getCartUseCase;
  CartScreenViewModel({required this.getCartUseCase}):super(CartScreenInitialStates());
  List<GetCartItemEntity> cartList =[];


  getCart()async{
    emit(CartScreenLoadingStates(loadingMessage: 'Loading....'));
    var either =  await getCartUseCase.invoke();
    either.fold(
            (l) {
              emit(CartScreenErrorStates(failures: l));
            },
            (response) {
              cartList = response.cart?.cartItems ?? [];
              emit(CartScreenSuccessStates(getCartResponseEntity: response));
            }
    );
  }
}