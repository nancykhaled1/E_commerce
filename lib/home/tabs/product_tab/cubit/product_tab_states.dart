import '../../../../data/api/failures.dart';
import '../../../../domain/entities/addToCartResponseEntity.dart';
import '../../../../domain/entities/productResponseEntity.dart';

abstract class ProductListTabStates{}

class ProductListTabInitialStates extends ProductListTabStates{}
class ProductListTabLoadingStates extends ProductListTabStates{
  String? loadingMessage  ;
  ProductListTabLoadingStates({required this.loadingMessage});
}
class ProductListTabErrorStates extends ProductListTabStates{
  Failures errors ;
  ProductListTabErrorStates({required this.errors});
}

class ProductListTabSuccessStates extends ProductListTabStates {
  ProductResponseEntity productResponseEntity ;
  ProductListTabSuccessStates({required this.productResponseEntity});
}
class AddToCartLoadingStates extends ProductListTabStates {
  String? loadingMessage;

  AddToCartLoadingStates({required this.loadingMessage});
}

class AddToCartTabErrorStates extends ProductListTabStates {
  Failures errors;

  AddToCartTabErrorStates({required this.errors});
}

class AddToCartSuccessStates extends ProductListTabStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessStates({required this.addToCartResponseEntity});
}