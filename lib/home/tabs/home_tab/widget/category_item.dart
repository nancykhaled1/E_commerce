import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget{
  CategoryOrBrandsEntity categoryEntity;
  CategoryItem({required this.categoryEntity});

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 5, color: MyTheme.primaryColor, spreadRadius: 1)],
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(categoryEntity.image ?? ""),
                  radius: 60.r,
                ),
              )
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              flex: 2,
              child:Text(categoryEntity.name ?? '',
                textWidthBasis: TextWidthBasis.longestLine,
                textAlign: TextAlign.center,

              )
          ),
        ],
      ),
    );
  }

}