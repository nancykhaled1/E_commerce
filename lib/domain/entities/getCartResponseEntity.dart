/// message : "done"
/// cart : {"_id":"664a66a196ddb5e5be518a70","user":"664a664796ddb5e5be518a68","cartItems":[{"product":"664297eed33ef3292dd9ef45","quantity":3,"price":308,"_id":"664a66a196ddb5e5be518a71"}],"totalprice":924,"createdAt":"2024-05-19T20:52:49.505Z","updatedAt":"2024-05-19T21:20:24.199Z","__v":0}

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.message, 
      this.cart,});


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

class GetCartEntity {
  GetCartEntity({
      this.id, 
      this.user, 
      this.cartItems, 
      this.totalprice, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? id;
  String? user;
  List<GetCartItemEntity>? cartItems;
  int? totalprice;
  String? createdAt;
  String? updatedAt;
  int? v;



}

/// product : "664297eed33ef3292dd9ef45"
/// quantity : 3
/// price : 308
/// _id : "664a66a196ddb5e5be518a71"

class GetCartItemEntity {
  GetCartItemEntity({
      this.product, 
      this.quantity, 
      this.price, 
      this.id,});


  String? product;
  int? quantity;
  int? price;
  String? id;



}