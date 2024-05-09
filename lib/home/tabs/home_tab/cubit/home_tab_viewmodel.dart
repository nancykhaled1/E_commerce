
import 'package:e_commerce_project/domain/usecase/get_all_brands_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_categories_usecase.dart';
import 'package:e_commerce_project/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({required this.getAllCategoryUseCase , required this.getAllBrandsUseCase }):super(HomeTabInitialStates());
  List<CategoryOrBrandsEntity> categoryList = [];
  List<CategoryOrBrandsEntity> brandList = [];
  TextEditingController controller = TextEditingController();


  void getCategories() async {
    emit(HomeTabLoadingStates(loadingMessage: 'Loading...'));
    var either = await getAllCategoryUseCase.invoke();
    either.fold((l) {
        emit(HomeTabErrorStates(errorMessage: l.errorMessage));
      },
          (response) {
        categoryList = response.data ?? [];
        if(brandList.isNotEmpty){
          emit(HomeTabSuccessStates(categoryResponseEntity: response));
        }
      },
    );
  }
  void getBrands() async {
    emit(HomeTabLoadingStates(loadingMessage: 'Loading...'));
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorStates(errorMessage: l.errorMessage));
    },
          (response) {
        brandList = response.data ?? [];
        if(categoryList.isNotEmpty){
          emit(HomeTabSuccessStates(categoryResponseEntity: response));
        }
      },
    );
  }



}