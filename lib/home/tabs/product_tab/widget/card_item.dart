import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_theme.dart';
import '../cubit/product_tab_viewmodel.dart';

class CardItem extends StatelessWidget{
  bool isWishlisted = false ;
  ProductEntity productEntity;
  CardItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
   return Container(
       width: 191.w,
       height: 237.h,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15.r),
         border: Border.all(
           color: MyTheme.primaryColor,
           width: 1,
         ),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Stack(
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(15.r),
                 child: Image.network( productEntity.imageCover ?? '',
                   fit: BoxFit.cover,
                   width: 191.w,
                   height: 128.h,
                 ),
               ),
               Positioned(
                 top: 5.h,
                 right: 10.w,
                 child: CircleAvatar(
                   backgroundColor: MyTheme.primaryColor,
                   child: InkWell(
                     onTap: () {},
                     child: isWishlisted == true
                         ? const Icon(Icons.favorite_rounded,color: MyTheme.whiteColor,)
                         : const Icon(
                       Icons.favorite_border_rounded,color: MyTheme.whiteColor,
                     ),

                   ),
                 ),
               ),

             ],
           ),
           SizedBox(
             height: 7.h,
           ),
           Padding(
             padding: EdgeInsets.only(left: 8.w),
             child: Text(
               productEntity.title ??'',
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
                 fontSize: 14.sp,
                 color: MyTheme.darkPrimaryColor,
                 fontWeight: FontWeight.w900,
               ),
             ),
           ),
           SizedBox(
             height: 7.h,
           ),
           Padding(
             padding: EdgeInsets.only(left: 8.w),
             child: Row(
               children: [
                 Text(
                   "EGP ${productEntity.price}",
                   maxLines: 1,
                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                     fontSize: 14.sp,
                     color: MyTheme.darkPrimaryColor,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 SizedBox(
                   width: 10.w,
                 ),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
             child: Row(
               children: [
                 Text(
                   "Review (${productEntity.ratingsAverage})",
                   maxLines: 1,
                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                     fontSize: 14.sp,
                     color: MyTheme.darkPrimaryColor,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 SizedBox(
                   width: 7.w,
                 ),
                 Icon(Icons.star,
                   color: Colors.amber,
                 ),
                 const Spacer(
                   flex: 1,
                 ),
                 InkWell(
                   onTap: () {
                     ProductTabViewModel.get(context).addToCart(productEntity.id ?? '');
                   },
                   child: Icon(
                     Icons.add_circle,
                     size: 32.sp,
                     color: MyTheme.primaryColor,
                   ),
                 )
               ],
             ),
           )

         ],
       )
   );
  }

}