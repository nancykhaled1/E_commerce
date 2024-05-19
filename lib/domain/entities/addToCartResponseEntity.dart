// /// status : "success"
// /// message : "Product added successfully to your cart"
// /// numOfCartItems : 1
// /// data : {"_id":"65bffb3d093eaa4bd670c521","cartOwner":"65bffa2d093eaa4bd670c4cb","products":[{"count":1,"_id":"65bffb3d093eaa4bd670c522","product":"6428ebc6dc1175abc65ca0b9","price":149}],"createdAt":"2024-02-04T21:01:49.367Z","updatedAt":"2024-02-04T21:01:49.564Z","__v":0,"totalCartPrice":149}
//
// class AddToCartResponseEntity {
//   AddToCartResponseEntity({
//       this.status,
//       this.message,
//       this.numOfCartItems,
//       this.data,});
//
//
//   String? status;
//   String? message;
//   int? numOfCartItems;
//   DataCartEntity? data;
//
//
//
// }
//
//
//
// class DataCartEntity {
//   DataCartEntity({
//       this.id,
//       this.cartOwner,
//       this.products,
//       this.createdAt,
//       this.updatedAt,
//       this.v,
//       this.totalCartPrice,});
//
//
//   String? id;
//   String? cartOwner;
//   List<ProductCartEntity>? products;
//   String? createdAt;
//   String? updatedAt;
//   int? v;
//   int? totalCartPrice;
//
//
//
// }
//
//
//
// class ProductCartEntity {
//   ProductCartEntity({
//       this.count,
//       this.id,
//       this.product,
//       this.price,});
//
//
//   int? count;
//   String? id;
//   String? product;
//   int? price;
//
//
// }