/// message : "done"
/// cart : {"user":"66486c733c8bf39da6548c1a","cartItems":[{"product":"66429679d33ef3292dd9ef38","quantity":1,"price":3083,"_id":"66486d0a3c8bf39da6548c30"}],"_id":"66486d0a3c8bf39da6548c2f","totalprice":3083,"createdAt":"2024-05-18T08:55:38.946Z","updatedAt":"2024-05-18T08:55:38.946Z","__v":0}

class AddProductToCartResponseEntity {
  AddProductToCartResponseEntity({
      this.message, 
      this.cart,

  });


  String? message;
  CartEntity? cart;




}

/// user : "66486c733c8bf39da6548c1a"
/// cartItems : [{"product":"66429679d33ef3292dd9ef38","quantity":1,"price":3083,"_id":"66486d0a3c8bf39da6548c30"}]
/// _id : "66486d0a3c8bf39da6548c2f"
/// totalprice : 3083
/// createdAt : "2024-05-18T08:55:38.946Z"
/// updatedAt : "2024-05-18T08:55:38.946Z"
/// __v : 0

class CartEntity {
  CartEntity({
      this.user, 
      this.cartItems, 
      this.id, 
      this.totalprice, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? user;
  List<CartItemEntity>? cartItems;
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

class CartItemEntity {
  CartItemEntity({
      this.product, 
      this.quantity, 
      this.price, 
      this.id,});


  String? product;
  int? quantity;
  int? price;
  String? id;



}