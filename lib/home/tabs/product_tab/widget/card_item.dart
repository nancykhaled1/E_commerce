import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/productsResponseEntity.dart';
import '../../../../utils/my_theme.dart';
import '../cubit/product_tab_viewmodel.dart';

class CardItem extends StatelessWidget{
  bool isWishlisted = false ;
  ProductEntity productEntity;
  CardItem({required this.productEntity});
  static const routeName = 'product';


  @override
  Widget build(BuildContext context) {
   return Material(
     elevation: 5,
     borderRadius: BorderRadius.circular(20),
     child: Container(
         width: 191.w,
         height: 237.h,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20.r),
           border: Border.all(
             color: MyTheme.whiteColor,
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
                   child: Image.network(
                     productEntity.images![2].secureUrl ?? '', // استخدم الصورة الأولى من قائمة الصور
                     fit: BoxFit.cover,
                     width: 191.w,
                     height: 128.h,
                   ),
                 ),



                 Positioned(
                   top: 5.h,
                   right: 10.w,
                   child: Image.asset('assets/images/Group 17.png')
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
                     "EGP ${productEntity.priceAfterDiscount}",
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
                   Stack(
                     children: [
                       Text(
                         '${productEntity.price}', // الرقم
                         textAlign: TextAlign.center, // محاذاة النص إلى الوسط
                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
                           fontSize: 14.sp,
                           color: MyTheme.darkPrimaryColor,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                       Positioned(
                         top: 7, // تحديد الموضع الرأسي لبداية الخط
                         left: 1, // تحديد الموضع الأفقي لبداية الخط
                         right: 0, // تحديد الموضع الأفقي لنهاية الخط
                         child: Container(
                           height: 1.0, // ارتفاع الخط
                           color: Colors.black, // لون الخط
                         ),
                       ),
                     ],
                   ),


                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
               child: Row(
                 children: [
                   Text(
                     "Review (${productEntity.ratingaAvg})",
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
     ),
   );
  }

}