import 'package:e_commerce_project/domain/entities/productsResponseEntity.dart';

/// message : "done"
/// page : 1
/// addproduct : [{"_id":"66429679d33ef3292dd9ef38","title":"T-shirt","slug":"t-shirt","price":3083,"priceAfterDiscount":2000,"description":"AL-AHLY T_SHIRT","stock":5,"quantity":0,"sold":15,"images":[{"public_id":"E-Commerce/product/ws40k5n8atmgjxbeef6z","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638603/E-Commerce/product/ws40k5n8atmgjxbeef6z.jpg","_id":"66429679d33ef3292dd9ef39","id":"66429679d33ef3292dd9ef39"},{"public_id":"E-Commerce/product/rmow2jcqe6uqrtpjkxfl","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638604/E-Commerce/product/rmow2jcqe6uqrtpjkxfl.jpg","_id":"66429679d33ef3292dd9ef3a","id":"66429679d33ef3292dd9ef3a"},{"public_id":"E-Commerce/product/ezrkyygh18eielqztqis","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638606/E-Commerce/product/ezrkyygh18eielqztqis.jpg","_id":"66429679d33ef3292dd9ef3b","id":"66429679d33ef3292dd9ef3b"}],"category":"664239cefc6c4382a680a803","subcategory":"663f953dabb03d3269bee7da","brand":"6642350e865c363d952dea8b","ratingaAvg":5,"ratingacount":3,"createdAt":"2024-05-13T22:38:49.460Z","updatedAt":"2024-05-13T22:38:49.460Z","__v":0,"myreview":[],"id":"66429679d33ef3292dd9ef38"},{"_id":"66429756d33ef3292dd9ef3e","title":"short","slug":"short","price":308,"priceAfterDiscount":200,"description":"practice short","stock":5,"quantity":0,"sold":15,"images":[{"public_id":"E-Commerce/product/axq5rdjybm1nbxyqfs0f","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638823/E-Commerce/product/axq5rdjybm1nbxyqfs0f.jpg","_id":"66429756d33ef3292dd9ef3f","id":"66429756d33ef3292dd9ef3f"},{"public_id":"E-Commerce/product/asewx5qcvlh3plg2hla6","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638824/E-Commerce/product/asewx5qcvlh3plg2hla6.jpg","_id":"66429756d33ef3292dd9ef40","id":"66429756d33ef3292dd9ef40"},{"public_id":"E-Commerce/product/uytkdlhasskbuydooxsl","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638825/E-Commerce/product/uytkdlhasskbuydooxsl.jpg","_id":"66429756d33ef3292dd9ef41","id":"66429756d33ef3292dd9ef41"},{"public_id":"E-Commerce/product/et5rvfyi1ix1wn4gdvbk","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638827/E-Commerce/product/et5rvfyi1ix1wn4gdvbk.jpg","_id":"66429756d33ef3292dd9ef42","id":"66429756d33ef3292dd9ef42"}],"category":"664239cefc6c4382a680a803","subcategory":"663f953dabb03d3269bee7da","brand":"6642350e865c363d952dea8b","ratingaAvg":5,"ratingacount":3,"createdAt":"2024-05-13T22:42:30.423Z","updatedAt":"2024-05-13T22:42:30.423Z","__v":0,"myreview":[],"id":"66429756d33ef3292dd9ef3e"},{"_id":"664297eed33ef3292dd9ef45","title":"Men's swing","slug":"men's-swing","price":308,"priceAfterDiscount":200,"description":"practice short","stock":5,"quantity":0,"sold":15,"images":[{"public_id":"E-Commerce/product/sy2qer0ru60xv4onweqe","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638974/E-Commerce/product/sy2qer0ru60xv4onweqe.jpg","_id":"664297eed33ef3292dd9ef46","id":"664297eed33ef3292dd9ef46"},{"public_id":"E-Commerce/product/l69rjsbbqdxhk8avqakl","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638975/E-Commerce/product/l69rjsbbqdxhk8avqakl.jpg","_id":"664297eed33ef3292dd9ef47","id":"664297eed33ef3292dd9ef47"},{"public_id":"E-Commerce/product/nsfpp3u0wtj43mzv7oac","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638979/E-Commerce/product/nsfpp3u0wtj43mzv7oac.jpg","_id":"664297eed33ef3292dd9ef48","id":"664297eed33ef3292dd9ef48"}],"category":"664239cefc6c4382a680a803","subcategory":"663f953dabb03d3269bee7da","brand":"6642350e865c363d952dea8b","ratingaAvg":5,"ratingacount":3,"createdAt":"2024-05-13T22:45:02.413Z","updatedAt":"2024-05-13T22:45:02.413Z","__v":0,"myreview":[],"id":"664297eed33ef3292dd9ef45"}]

class ProductsResponseDto extends ProductsResponseEntity {
  ProductsResponseDto({
      super.message,
    super.page,
    super.addproduct,});

  ProductsResponseDto.fromJson(dynamic json) {
    message = json['message'];
    page = json['page'];
    if (json['addproduct'] != null) {
      addproduct = [];
      json['addproduct'].forEach((v) {
        addproduct?.add(ProductDto.fromJson(v));
      });
    }
  }
  String? message;
  int? page;
 // List<ProductDto>? addproduct;



}

/// _id : "66429679d33ef3292dd9ef38"
/// title : "T-shirt"
/// slug : "t-shirt"
/// price : 3083
/// priceAfterDiscount : 2000
/// description : "AL-AHLY T_SHIRT"
/// stock : 5
/// quantity : 0
/// sold : 15
/// images : [{"public_id":"E-Commerce/product/ws40k5n8atmgjxbeef6z","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638603/E-Commerce/product/ws40k5n8atmgjxbeef6z.jpg","_id":"66429679d33ef3292dd9ef39","id":"66429679d33ef3292dd9ef39"},{"public_id":"E-Commerce/product/rmow2jcqe6uqrtpjkxfl","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638604/E-Commerce/product/rmow2jcqe6uqrtpjkxfl.jpg","_id":"66429679d33ef3292dd9ef3a","id":"66429679d33ef3292dd9ef3a"},{"public_id":"E-Commerce/product/ezrkyygh18eielqztqis","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715638606/E-Commerce/product/ezrkyygh18eielqztqis.jpg","_id":"66429679d33ef3292dd9ef3b","id":"66429679d33ef3292dd9ef3b"}]
/// category : "664239cefc6c4382a680a803"
/// subcategory : "663f953dabb03d3269bee7da"
/// brand : "6642350e865c363d952dea8b"
/// ratingaAvg : 5
/// ratingacount : 3
/// createdAt : "2024-05-13T22:38:49.460Z"
/// updatedAt : "2024-05-13T22:38:49.460Z"
/// __v : 0
/// myreview : []
/// id : "66429679d33ef3292dd9ef38"

class ProductDto extends ProductEntity {
  ProductDto({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.priceAfterDiscount,
    super.description,
    super.stock,
    super.quantity,
    super.sold,
    super.images,
    super.category,
    super.subcategory,
    super.brand,
    super.ratingaAvg,
    super.ratingacount,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.myreview,
      });

  ProductDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    description = json['description'];
    stock = json['stock'];
    quantity = json['quantity'];
    sold = json['sold'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(ImagesDto.fromJson(v));
      });
    }
    category = json['category'];
    subcategory = json['subcategory'];
    brand = json['brand'];
    ratingaAvg = json['ratingaAvg'];
    ratingacount = json['ratingacount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['myreview'] != null) {
      // myreview = [];
      // json['myreview'].forEach((v) {
      //   myreview?.add(Dynamic.fromJson(v));
      // });
    }
    id = json['id'];
  }
  String? id;
  String? title;
  String? slug;
  int? price;
  int? priceAfterDiscount;
  String? description;
  int? stock;
  int? quantity;
  int? sold;
 // List<Images>? images;
  String? category;
  String? subcategory;
  String? brand;
  int? ratingaAvg;
  int? ratingacount;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<dynamic>? myreview;




}

/// public_id : "E-Commerce/product/ws40k5n8atmgjxbeef6z"
/// secure_url : "https://res.cloudinary.com/diubywm4o/image/upload/v1715638603/E-Commerce/product/ws40k5n8atmgjxbeef6z.jpg"
/// _id : "66429679d33ef3292dd9ef39"
/// id : "66429679d33ef3292dd9ef39"

class ImagesDto extends ImagesEntity{
  ImagesDto({
      super.publicId,
      super.secureUrl,
      super.id,
      });

  ImagesDto.fromJson(dynamic json) {
    publicId = json['public_id'];
    secureUrl = json['secure_url'];
    id = json['_id'];
    id = json['id'];
  }
  String? publicId;
  String? secureUrl;
  String? id;



}