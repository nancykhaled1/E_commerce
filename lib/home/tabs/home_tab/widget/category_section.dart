import 'package:flutter/material.dart';

import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget{
  List<CategoryOrBrandsEntity> categoryList;
  CategorySection({required this.categoryList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GridView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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