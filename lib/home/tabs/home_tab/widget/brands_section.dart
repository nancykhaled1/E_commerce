import 'package:e_commerce_project/home/tabs/home_tab/widget/brands_item.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';
import '../../../../utils/my_theme.dart';
import 'category_item.dart';

class BrandsSection extends StatelessWidget{
  List<CategoryOrBrandsEntity> brandList;
  BrandsSection({required this.brandList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GridView.builder(
          itemCount: brandList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,// Number of columns
          ),
          itemBuilder: (BuildContext context, int index) {
            return BrandsItem(brandsEntity: brandList[index],);
          }),
    );

      Container(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              color: MyTheme.primaryColor,
              width: 2,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: brandList.length,
          itemBuilder: (context, index) {
            return BrandsItem(brandsEntity: brandList[index] );
          }
      ),
    );

  }
  }