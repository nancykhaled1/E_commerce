import 'package:e_commerce_project/domain/di.dart';
import 'package:e_commerce_project/home/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_project/home/tabs/product_tab/cubit/product_tab_viewmodel.dart';
import 'package:e_commerce_project/home/tabs/product_tab/product_details/product_details.dart';
import 'package:e_commerce_project/home/tabs/product_tab/widget/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_theme.dart';
import '../../cart/cartscreen.dart';

class ProductTab extends StatelessWidget {
  ProductTabViewModel viewModel = ProductTabViewModel(getAllProductUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase()
      );
  //addToCartUseCase: injectAddToCartUseCase()
 // static const routeName = 'product';
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
                 Padding(
                   padding: const EdgeInsets.only(
                     top: 20
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Categories',
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.w500,

                       )
                       )
                     ],
                   ),
                 ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, CartScreen.routNam);
                            },
                            icon: Badge(
                              label: Text(viewModel.numOfCartItems.toString()),
                              child: Icon(
                                size: 29,
                                Icons.shopping_cart_outlined,
                                color: Color(0xffE66F51),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  state is ProductListTabLoadingStates ?
                  Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.primaryColor,
                    ),
                  ):
                  Expanded(
                    child: GridView.builder(
                      controller: viewModel.scrollController,
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
