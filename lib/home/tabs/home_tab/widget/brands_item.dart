import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/CategoryOrBrandsResponseEntity.dart';

class BrandsItem extends StatelessWidget{
  CategoryOrBrandsEntity brandsEntity;
  BrandsItem({required this.brandsEntity});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CircleAvatar(
              backgroundImage: NetworkImage(brandsEntity.image ?? ""),
              radius: 70.r,
            )
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            flex: 2,
            child:Text(brandsEntity.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,

            )
        ),
      ],
    );



  }

}