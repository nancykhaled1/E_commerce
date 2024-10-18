import 'dart:core';

import 'package:e_commerce_project/home/cart/cubit/cart_screen_states.dart';
import 'package:e_commerce_project/home/cart/cubit/cartscreenviewmodel.dart';
import 'package:e_commerce_project/home/cart/widget/cartItem.dart';
import 'package:e_commerce_project/home/home_screen/home_screen.dart';
import 'package:e_commerce_project/home/tabs/product_tab/product_tab.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/di.dart';

class CartScreen extends StatelessWidget {
  static const routNam = 'cartScreen';

  int selinddex = 0, count = 0;
  bool col = true; //color
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CartScreenViewModel viewModel = CartScreenViewModel(
        getCartUseCase: injectGetCartUseCase());
    return BlocBuilder<CartScreenViewModel, CartScreenStates>(
        bloc: viewModel..getCart(),
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: MyTheme.whiteColor,
                leading: IconButton(
                  color: MyTheme.primaryColor,
                  icon: const Icon(Icons.arrow_back_sharp),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                  },
                ),
                title: Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.blackColor,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 29,
                      Icons.search_outlined,
                      color: MyTheme.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 29,
                      Icons.shopping_cart_outlined,
                      color: MyTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              body: state is CartScreenSuccessStates ?
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(getCartItemEntity: viewModel.cartList[index],);
                        },
                        itemCount: viewModel.cartList.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 60.0,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                color: Color(0xff264653),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${state.getCartResponseEntity.cart?.totalprice}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffE66F51),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 50,
                          width: 250,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Check Out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ListView.builder(itemBuilder: itemBuilder),
                ],
              ) :
              Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                ),
              )
          );
        }
    );
  }
  }

