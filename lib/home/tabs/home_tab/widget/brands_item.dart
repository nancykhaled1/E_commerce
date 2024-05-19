import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/domain/entities/brandsResponseEntity.dart';
import 'package:flutter/material.dart';


class BrandsItem extends StatelessWidget{
  BrandsEntity brandsEntity;
  BrandsItem({required this.brandsEntity});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: brandsEntity.logo?.secureUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwX2tJ1JcWGo8OnetQBw73PGvklHCWAAyi3hc2HCYzsg&s',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) { return Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://res.cloudinary.com/diubywm4o/image/upload/v1715615636/E-Commerce/brand/zsq3s7zrihvayjaqmoig.jpg'
                    ));},
                    fit: BoxFit.cover,
                  // width: 140,
                  // height: 140,
                ),
              ),
            ),
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