import 'package:e_commerce_project/domain/di.dart';
import 'package:e_commerce_project/home/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_project/home/tabs/product_tab/cubit/product_tab_viewmodel.dart';
import 'package:e_commerce_project/home/tabs/product_tab/product_details/product_details.dart';
import 'package:e_commerce_project/home/tabs/product_tab/widget/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_theme.dart';

class ProductTab extends StatelessWidget {
  ProductTabViewModel viewModel = ProductTabViewModel(getAllProductUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getProducts(),
      child: BlocBuilder<ProductTabViewModel,ProductListTabStates>(
      //  bloc: viewModel..getProducts(),
          builder: (context,state){
          return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // vertical: 15.0,
                horizontal: 15.0
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/route.png',
                    color: MyTheme.primaryColor,
                    height: 50.h,
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
                  SizedBox(
                    height: 10.h,
                  ),
                  state is ProductListTabLoadingStates ?
                  Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.primaryColor,
                    ),
                  ):
                  Expanded(
                    child: GridView.builder(
                        itemCount: viewModel.productList.length,
                        scrollDirection: Axis.vertical,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.4,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,// Number of columns
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(ProductDetails.routeName,
                                arguments: viewModel.productList[index]
                                );
                              },
                              child: CardItem(productEntity: viewModel.productList[index],));
                        }),
                  )




                ],
              ),
            ),
          ),
        );
          }
      ),
    );





  }
}
