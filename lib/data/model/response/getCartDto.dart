import 'package:e_commerce_project/domain/entities/getCartResponseEntity.dart';

/// message : "done"
/// cart : {"_id":"664a66a196ddb5e5be518a70","user":"664a664796ddb5e5be518a68","cartItems":[{"product":"664297eed33ef3292dd9ef45","quantity":3,"price":308,"_id":"664a66a196ddb5e5be518a71"}],"totalprice":924,"createdAt":"2024-05-19T20:52:49.505Z","updatedAt":"2024-05-19T21:20:24.199Z","__v":0}

class GetCartDto extends GetCartResponseEntity {
  GetCartDto({
      super.message,
    super.cart,});

  GetCartDto.fromJson(dynamic json) {
    message = json['message'];
    cart = json['cart'] != null ? GetCartsDto.fromJson(json['cart']) : null;
  }
  String? message;
  GetCartEntity? cart;

  

}

/// _id : "664a66a196ddb5e5be518a70"
/// user : "664a664796ddb5e5be518a68"
/// cartItems : [{"product":"664297eed33ef3292dd9ef45","quantity":3,"price":308,"_id":"664a66a196ddb5e5be518a71"}]
/// totalprice : 924
/// createdAt : "2024-05-19T20:52:49.505Z"
/// updatedAt : "2024-05-19T21:20:24.199Z"
/// __v : 0

class GetCartsDto extends GetCartEntity {
  GetCartsDto({
    super.id,
    super.user,
    super.cartItems,
    super.totalprice,
    super.createdAt,
    super.updatedAt,
    super.v,});

  GetCartsDto.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(GetCartItemDto.fromJson(v));
      });
    }
    totalprice = json['totalprice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? user;
 // List<GetCartItemDto>? cartItems;
  int? totalprice;
  String? createdAt;
  String? updatedAt;
  int? v;



}

/// product : "664297eed33ef3292dd9ef45"
/// quantity : 3
/// price : 308
/// _id : "664a66a196ddb5e5be518a71"

class GetCartItemDto extends GetCartItemEntity{
  GetCartItemDto({
    super.product,
    super.quantity,
    super.price,
    super.id,});

  GetCartItemDto.fromJson(dynamic json) {
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    id = json['_id'];
  }
  String? product;
  int? quantity;
  int? price;
  String? id;



}