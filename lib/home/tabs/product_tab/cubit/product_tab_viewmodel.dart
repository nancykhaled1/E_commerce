
import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:e_commerce_project/domain/usecase/add_to_cart_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_brands_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_categories_usecase.dart';
import 'package:e_commerce_project/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_project/home/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';
import '../../../../domain/usecase/get_all_products_usecase.dart';

class ProductTabViewModel extends Cubit<ProductListTabStates>{
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabViewModel({required this.getAllProductUseCase , required this.addToCartUseCase }):super(ProductListTabInitialStates());
  List<ProductEntity> productList = [];
  int numOfCartItems =0;

  void getProducts() async {
    emit(ProductListTabLoadingStates(loadingMessage: 'Loading...'));
    var either = await getAllProductUseCase.invoke();
    either.fold((l) {
      emit(ProductListTabErrorStates(errors: l));
    },
          (response) {
            productList = response.data ?? [];
          emit(ProductListTabSuccessStates(productResponseEntity: response));

      },
    );
  }

  static ProductTabViewModel get(context) => BlocProvider.of(context);

  void addToCart(String productId) async {
    emit(AddToCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartTabErrorStates(errors: l));
    },
          (response) {
        numOfCartItems = response.numOfCartItems ?? 0;
        print('Num of cart items $numOfCartItems');
        emit(AddToCartSuccessStates(addToCartResponseEntity: response));

      },
    );
  }



}