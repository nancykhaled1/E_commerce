import '../../../../data/api/failures.dart';
import '../../../../domain/entities/addProductToCartResponseEntity.dart';
import '../../../../domain/entities/addToCartResponseEntity.dart';
import '../../../../domain/entities/productsResponseEntity.dart';

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
  ProductsResponseEntity productResponseEntity ;
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
  AddProductToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessStates({required this.addToCartResponseEntity});
}