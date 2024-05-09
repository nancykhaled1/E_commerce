import 'dart:core';

import 'package:flutter/material.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});
  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  int selinddex = 0;
  void initState() {
    super.initState();
  }

  bool col = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15
                ),
                child: Center(
                  child: Text(
                    'Favourite',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    //  color: Color(0xff264653),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 42,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
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
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1, 1),
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(-1, -1),
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        height: 110,
                        child: Row(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(
                                width: 120,
                                "https://5.imimg.com/data5/IOS/Default/2022/11/LB/XN/HE/17552598/product-jpeg-500x500.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Nike Air Jordon",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              col = !col;
                                            });
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              col
                                                  ? "assets/images/img.png"
                                                  : "assets/images/fav_icon.png",
                                              color: col ? null : Color(0xffE66F51),
                                              width: 25,
                                              height: 25,
                                            ),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(2, 3),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                ),
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(-2, 3),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffC7C7C7),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "ment green",
                                        style: TextStyle(
                                          color: Color(0xffE66F51),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          height: 15,
                                          width: 1,
                                          color: Color(0xffE66F51),
                                        ),
                                      ),
                                      Text(
                                        "Size :40",
                                        style: TextStyle(
                                          color: Color(0xffE66F51),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "EGP 500",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                        child: Container(
                                          width: 100,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color(0xffE66F51),
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffE66F51),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              // ListView.builder(itemBuilder: itemBuilder),

            ],

          ),
        ),
      ),
    );
  }
}



