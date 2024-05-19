import '../../../domain/entities/addProductToCartResponseEntity.dart';

/// message : "done"
/// cart : {"user":"66486c733c8bf39da6548c1a","cartItems":[{"product":"66429679d33ef3292dd9ef38","quantity":1,"price":3083,"_id":"66486d0a3c8bf39da6548c30"}],"_id":"66486d0a3c8bf39da6548c2f","totalprice":3083,"createdAt":"2024-05-18T08:55:38.946Z","updatedAt":"2024-05-18T08:55:38.946Z","__v":0}

class AddProductToCartDto extends AddProductToCartResponseEntity {
  AddProductToCartDto({
      super.message,
      super.cart,


  });

  AddProductToCartDto.fromJson(dynamic json) {
    message = json['message'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;


  }
  String? message;
  // Cart? cart;



}

/// user : "66486c733c8bf39da6548c1a"
/// cartItems : [{"product":"66429679d33ef3292dd9ef38","quantity":1,"price":3083,"_id":"66486d0a3c8bf39da6548c30"}]
/// _id : "66486d0a3c8bf39da6548c2f"
/// totalprice : 3083
/// createdAt : "2024-05-18T08:55:38.946Z"
/// updatedAt : "2024-05-18T08:55:38.946Z"
/// __v : 0

class Cart extends CartEntity {
  Cart({
      super.user,
    super.cartItems,
    super.id,
    super.totalprice,
    super.createdAt,
    super.updatedAt,
    super.v,});

  Cart.fromJson(dynamic json) {
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    id = json['_id'];
    totalprice = json['totalprice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? user;
  // List<CartItems>? cartItems;
  String? id;
  int? totalprice;
  String? createdAt;
  String? updatedAt;
  int? v;



}

/// product : "66429679d33ef3292dd9ef38"
/// quantity : 1
/// price : 3083
/// _id : "66486d0a3c8bf39da6548c30"

class CartItems extends CartItemEntity {
  CartItems({
    super.product,
    super.quantity,
    super.price,
    super.id,});

  CartItems.fromJson(dynamic json) {
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