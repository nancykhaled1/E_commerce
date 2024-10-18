
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/getCartResponseEntity.dart';

import '../../../../domain/entities/brandsResponseEntity.dart';
import '../../../../domain/entities/categoryResponseEntity.dart';

abstract class CartScreenStates{}
class CartScreenInitialStates extends CartScreenStates{}

class CartScreenLoadingStates extends CartScreenStates{
  String? loadingMessage;
  CartScreenLoadingStates({required this.loadingMessage});
}
class CartScreenErrorStates extends CartScreenStates{
  Failures failures;
  CartScreenErrorStates({required this.failures});
}
class CartScreenSuccessStates extends CartScreenStates{
  GetCartResponseEntity getCartResponseEntity;
  CartScreenSuccessStates({required this.getCartResponseEntity});
}
