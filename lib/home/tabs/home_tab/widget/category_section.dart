import 'package:flutter/material.dart';

import '../../../../domain/di.dart';
import '../../../../domain/entities/categoryResponseEntity.dart';
import '../cubit/home_tab_viewmodel.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget{
  List<CategoryEntity> categoryList;
  CategorySection({required this.categoryList});
  HomeTabViewModel viewModel = HomeTabViewModel(getAllCategoryUseCase: injectGetAllCategoryUseCase(), getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GridView.builder(
        controller: viewModel.scrollController,
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10,// Number of columns
          ),
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(categoryEntity: categoryList[index],);
          }),
    );
  }

}