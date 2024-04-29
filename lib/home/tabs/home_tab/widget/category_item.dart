import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget{
  CategoryOrBrandsEntity categoryEntity;
  CategoryItem({required this.categoryEntity});

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CircleAvatar(
              backgroundImage: NetworkImage(categoryEntity.image ?? ""),
              radius: 60.r,
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
    );
  }

}