import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = 'product_details';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        foregroundColor: MyTheme.primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkPrimaryColor),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.search,
            size: 30,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined,
            size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: MyTheme.primaryColor,
                      indicatorBackgroundColor: MyTheme.whiteColor,
                      indicatorBottomPadding: 20.h,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: args.images!.map((url) =>
                        Image.network(
                          url,
                          fit: BoxFit.cover,
                          height: 300.h,
                          width: double.infinity,
                        )).toList(),
                  ),
            ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    args.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp,
                          color: MyTheme.darkPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  "EGP ${args.price}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: MyTheme.darkPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                          color: MyTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Sold : ${args.sold}",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: MyTheme.darkPrimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Image.asset('assets/images/star_icon.png'),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "${args.ratingsAverage}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.darkPrimaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                )),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                    borderRadius: BorderRadius.circular(
                      100.r,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: MyTheme.whiteColor,
                          size: 28.sp,
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.whiteColor),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: MyTheme.whiteColor,
                          size: 28.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: MyTheme.darkPrimaryColor,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReadMoreText(
              '${args.description}',
              trimLines: 3,
              trimMode: TrimMode.Line,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    color: MyTheme.primaryColor.withOpacity(
                      0.6,
                    ),
                  ),
              trimCollapsedText: ' Read More',
              trimExpandedText: ' Read Less',
              moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyTheme.darkPrimaryColor),
              lessStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyTheme.darkPrimaryColor),
            ),
            Spacer(
              flex: 30,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total price",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            color: MyTheme.primaryColor,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "EGP ${args.price}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          color: MyTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 32.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: MyTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.add_shopping_cart_outlined),
                          Text("Add to cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: MyTheme.whiteColor)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
