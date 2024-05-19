import '../../../domain/entities/categoryResponseEntity.dart';

/// message : "done"
/// category : [{"logo":{"public_id":"E-Commerce/category/znthrbrmybdrqawkd1tu","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"},"_id":"664239cefc6c4382a680a803","name":"clothes","slug":"clothes","createdAt":"2024-05-13T16:03:26.809Z","updatedAt":"2024-05-13T16:03:26.809Z","__v":0},{"logo":{"public_id":"E-Commerce/category/vyzhd2jzduhavr4fw5qf","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615616/E-Commerce/category/vyzhd2jzduhavr4fw5qf.jpg"},"_id":"66423cab2474c0f43f82969b","name":"makeup","slug":"makeup","createdAt":"2024-05-13T16:15:39.172Z","updatedAt":"2024-05-13T16:15:39.172Z","__v":0},{"logo":{"public_id":"E-Commerce/category/uvbwi45doipuez8elmam","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715616059/E-Commerce/category/uvbwi45doipuez8elmam.jpg"},"_id":"66423e662474c0f43f8296b7","name":"Home","slug":"home","createdAt":"2024-05-13T16:23:02.581Z","updatedAt":"2024-05-13T16:23:02.581Z","__v":0}]

class CategoryResponseDto extends CategoryResponseEntity{
  CategoryResponseDto({
      super.message,
    super.category,});

  CategoryResponseDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(CategoryDto.fromJson(v));
      });
    }
  }
  String? message;
  //List<CategoryOrBrandDto>? category;



}

/// logo : {"public_id":"E-Commerce/category/znthrbrmybdrqawkd1tu","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"}
/// _id : "664239cefc6c4382a680a803"
/// name : "clothes"
/// slug : "clothes"
/// createdAt : "2024-05-13T16:03:26.809Z"
/// updatedAt : "2024-05-13T16:03:26.809Z"
/// __v : 0

class CategoryDto extends CategoryEntity{
  CategoryDto({
      super.logo,
    super.id,
    super.name,
    super.slug,
    super.createdAt,
    super.updatedAt,
    super.v,});

  CategoryDto.fromJson(dynamic json) {
    logo = json['logo'] != null ? CategoryLogoDto.fromJson(json['logo']) : null;
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  // BrandsLogoEntity? logo;
  // String? id;
  // String? name;
  // String? slug;
  // String? createdAt;
  // String? updatedAt;
  // int? v;



}

/// public_id : "E-Commerce/category/znthrbrmybdrqawkd1tu"
/// secure_url : "https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"

class CategoryLogoDto extends CategoryLogoEntity {
  CategoryLogoDto({
    super.publicId,
    super.secureUrl,});

  CategoryLogoDto.fromJson(dynamic json) {
    publicId = json['public_id'];
    secureUrl = json['secure_url'];
  }






}