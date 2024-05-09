import 'package:e_commerce_project/domain/di.dart';
import 'package:e_commerce_project/home/cart/cartscreen.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20
                        ),
                        child: Image.asset(
                          'assets/images/E-Shop.png',
                          // color: MyTheme.primaryColor,
                          height: 60.h,
                          width: 200,
                        ),
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 42,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: viewModel.controller,
                                  decoration: InputDecoration(
                                    labelText: 'Search',
                                    labelStyle: TextStyle(
                                      color: Color(0xffC0BFBF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    prefixIcon: Icon(Icons.search),
                                    prefixIconColor: Colors.redAccent,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xffE66F51)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xffE66F51)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  size: 29,
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xffE66F51),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.w,
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
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge
                            ),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'View all',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall?.copyWith(
                                      color: MyTheme.primaryColor
                                  )
                                ))
                          ],
                        ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Brands',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge
                            ),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                    'View all',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall?.copyWith(
                                        color: MyTheme.primaryColor
                                    )
                                ))
                          ],
                        ),
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
