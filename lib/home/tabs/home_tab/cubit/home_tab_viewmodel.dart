
import 'package:e_commerce_project/domain/usecase/get_all_brands_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_categories_usecase.dart';
import 'package:e_commerce_project/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';
import '../../../../domain/entities/brandsResponseEntity.dart';
import '../../../../domain/entities/categoryResponseEntity.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({
    required this.getAllCategoryUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialStates()) {
    // Listen to scroll events and fetch next page when reaching the end
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
          state is! HomeTabLoadingStates) {
        getCategories();
        getBrands();
      }
    });
  }

  List<CategoryEntity> categoryList = [];
  List<BrandsEntity> brandList = [];
  TextEditingController controller = TextEditingController();
  final scrollController = ScrollController();
  int pageNum = 0;
  int pageNum2 = 0;

  void getCategories() async {
    emit(HomeTabLoadingStates(loadingMessage: 'Loading...'));
    pageNum ++; // Update page number for next request

    var either = await getAllCategoryUseCase.invoke(pageNum);
    either.fold(
          (l) {
        emit(HomeTabErrorStates(errorMessage: l.errorMessage));
      },
          (response) {
            categoryList.addAll(response.category ?? []);

        emit(HomeSuccessStates(categoryEntity: response));
      },
    );
  }


  void getBrands() async {
    emit(HomeTabLoadingStates(loadingMessage: 'Loading...'));
    pageNum2++;
    var either = await getAllBrandsUseCase.invoke(pageNum2);
    either.fold(
          (l) {
        emit(HomeTabErrorStates(errorMessage: l.errorMessage));
      },
          (response) {
        brandList.addAll(response.result ?? []);
        emit(HomeTabSuccessStates(brandEntity: response));
      },
    );
  }
}
