import '../../../domain/entities/brandsResponseEntity.dart';

/// message : "done"
/// result : [{"logo":{"public_id":"E-Commerce/brand/goegiz86jhh8iinde6vq","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"},"_id":"6642350e865c363d952dea8b","name":"Puma","slug":"puma","createdAt":"2024-05-13T15:43:10.834Z","updatedAt":"2024-05-13T15:43:10.834Z","__v":0},{"logo":{"public_id":"E-Commerce/brand/h7upa0wzjlgdqwzc07oa","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615602/E-Commerce/brand/h7upa0wzjlgdqwzc07oa.avif"},"_id":"66423c9c2474c0f43f829699","name":"Xaiomi","slug":"xaiomi","createdAt":"2024-05-13T16:15:24.864Z","updatedAt":"2024-05-13T16:15:24.864Z","__v":0},{"logo":{"public_id":"E-Commerce/brand/zsq3s7zrihvayjaqmoig","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615636/E-Commerce/brand/zsq3s7zrihvayjaqmoig.jpg"},"_id":"66423cbf2474c0f43f82969e","name":"Iphone","slug":"iphone","createdAt":"2024-05-13T16:15:59.078Z","updatedAt":"2024-05-13T16:15:59.078Z","__v":0}]

class BrandsResponseDto extends BrandsResponseEntity{
  BrandsResponseDto({
      super.message,
    super.result,});

  BrandsResponseDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(BrandsDto.fromJson(v));
      });
    }
  }
  String? message;
 // List<Result>? result;



}

/// logo : {"public_id":"E-Commerce/brand/goegiz86jhh8iinde6vq","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"}
/// _id : "6642350e865c363d952dea8b"
/// name : "Puma"
/// slug : "puma"
/// createdAt : "2024-05-13T15:43:10.834Z"
/// updatedAt : "2024-05-13T15:43:10.834Z"
/// __v : 0

class BrandsDto extends BrandsEntity{
  BrandsDto({
    super.logo,
    super.id,
    super.name,
    super.slug,
    super.createdAt,
    super.updatedAt,
    super.v,});

  BrandsDto.fromJson(dynamic json) {
    logo = json['logo'] != null ? BrandsLogoDto.fromJson(json['logo']) : null;
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
 // Logo? logo;
 //  String? id;
 //  String? name;
 //  String? slug;
 //  String? createdAt;
 //  String? updatedAt;
 //  int? v;



}

/// public_id : "E-Commerce/brand/goegiz86jhh8iinde6vq"
/// secure_url : "https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"

class BrandsLogoDto extends BrandsLogoEntity {
  BrandsLogoDto({
      super.publicId,
      super.secureUrl,});

  BrandsLogoDto.fromJson(dynamic json) {
    publicId = json['public_id'];
    secureUrl = json['secure_url'];
  }




}