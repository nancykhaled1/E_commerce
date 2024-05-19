
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/categoryResponseEntity.dart';

class CategoryItem extends StatelessWidget{
  CategoryEntity categoryEntity;
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
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 5, color: MyTheme.primaryColor, spreadRadius: 1)],
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: categoryEntity.logo?.secureUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwX2tJ1JcWGo8OnetQBw73PGvklHCWAAyi3hc2HCYzsg&s',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error){ return Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://res.cloudinary.com/diubywm4o/image/upload/v1715616250/E-Commerce/category/dssqlykcbdlqzpbmzqdj.png'
                    ));},
                  fit: BoxFit.cover,
                  // width: 140,
                  // height: 140,
                ),
              ),
            ),
          )
          ,
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