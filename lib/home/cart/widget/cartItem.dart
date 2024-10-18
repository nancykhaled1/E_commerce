import 'package:e_commerce_project/domain/entities/getCartResponseEntity.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget{
  GetCartItemEntity getCartItemEntity;

  CartItem({required this.getCartItemEntity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
        height: 115,
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
                        padding: const EdgeInsets.all(
                            2.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            color: Colors.black,
                            iconSize: 25,
                            onPressed: () {},
                            icon: Icon(
                              Icons
                                  .delete_forever_outlined,
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
                          borderRadius: BorderRadius
                              .circular(10),
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
                        padding: const EdgeInsets
                            .symmetric(
                            horizontal: 5),
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${getCartItemEntity.price}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xffE66F51),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   count--;
                                    // });
                                  },
                                  backgroundColor:
                                  Color(0xffE66F51),
                                  mini: true,
                                  heroTag: 'count-',
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                  color: Color(
                                      0xffE66F51),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   count++;
                                    // });
                                  },
                                  backgroundColor:
                                  Color(0xffE66F51),
                                  mini: true,
                                  heroTag: 'count+',
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
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
  }

}