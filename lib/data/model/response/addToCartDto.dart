import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';


class AddToCartDto extends AddToCartResponseEntity {
  AddToCartDto({
      super.status,
    super.message,
    super.numOfCartItems,
    super.data,});

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? DataCartDto.fromJson(json['data']) : null;
  }
}



class DataCartDto extends DataCartEntity {
  DataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  DataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}


class ProductCartDto extends ProductCartEntity {
  ProductCartDto({
    super.count,
    super.id,
    super.product,
    super.price,});

  ProductCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }




}