import 'package:e_commerce_project/domain/di.dart';
import 'package:e_commerce_project/home/tabs/home_tab/widget/brands_section.dart';
import 'package:e_commerce_project/home/tabs/home_tab/widget/category_section.dart';
import 'package:e_commerce_project/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_project/home/tabs/home_tab/cubit/home_tab_viewmodel.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> sliderImage = [
    'assets/images/announcment1.png',
    'assets/images/announcment2.png',
    'assets/images/announcment3.png'
  ];
  HomeTabViewModel viewModel = HomeTabViewModel(getAllCategoryUseCase: injectGetAllCategoryUseCase(), getAllBrandsUseCase: injectGetAllBrandsUseCase());


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: viewModel..getCategories()..getBrands() ,
        builder: (context,state) {
      //  if(state is HomeTabLoadingStates){
      //    return const Center(
      //        child: CircularProgressIndicator());
      //  }else{
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
               // vertical: 15.0,
                horizontal: 15.0
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/e-shop.png',
                        color: MyTheme.primaryColor,
                        height: 100.h,
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: MyTheme.primaryColor,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  hintText: 'what do you search for ?',
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 30,
                                    color: MyTheme.primaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        color: MyTheme.primaryColor),
                                  )),
                            ),
                          ),
                           SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: MyTheme.primaryColor,
                              )),
                        ],
                      ),
                      ImageSlideshow(
                        width: double.infinity,
                        height: 200.h,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          print('Page changed: $value');
                        },
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: sliderImage
                            .map((url) =>
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                url,
                                fit: BoxFit.fill,
                                width: 300.w,
                                height: 200.h,
                              ),
                            ))
                            .toList(),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge?.copyWith(
                              color: MyTheme.primaryColor
                            )
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                'View all',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium?.copyWith(
                                    color: MyTheme.primaryColor
                                )
                              ))
                        ],
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      state is HomeTabLoadingStates ?
                      Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryColor,
                        ),
                      ):
                      CategorySection(categoryList: viewModel.categoryList),
                       SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Brands',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge?.copyWith(
                            color: MyTheme.primaryColor
                        )
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      state is HomeTabLoadingStates ?
                      Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryColor,
                        ),
                      ):
                      BrandsSection(brandList: viewModel.brandList),
                    ],
                  ),
                ),
              ),
            ),
          );
       // }



        }

          // viewModel.categoryList.isEmpty ?
          //   const Center(child: CircularProgressIndicator()) :


    );


  }
}
