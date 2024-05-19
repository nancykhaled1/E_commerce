/// message : "done"
/// result : [{"logo":{"public_id":"E-Commerce/brand/goegiz86jhh8iinde6vq","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"},"_id":"6642350e865c363d952dea8b","name":"Puma","slug":"puma","createdAt":"2024-05-13T15:43:10.834Z","updatedAt":"2024-05-13T15:43:10.834Z","__v":0},{"logo":{"public_id":"E-Commerce/brand/h7upa0wzjlgdqwzc07oa","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615602/E-Commerce/brand/h7upa0wzjlgdqwzc07oa.avif"},"_id":"66423c9c2474c0f43f829699","name":"Xaiomi","slug":"xaiomi","createdAt":"2024-05-13T16:15:24.864Z","updatedAt":"2024-05-13T16:15:24.864Z","__v":0},{"logo":{"public_id":"E-Commerce/brand/zsq3s7zrihvayjaqmoig","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615636/E-Commerce/brand/zsq3s7zrihvayjaqmoig.jpg"},"_id":"66423cbf2474c0f43f82969e","name":"Iphone","slug":"iphone","createdAt":"2024-05-13T16:15:59.078Z","updatedAt":"2024-05-13T16:15:59.078Z","__v":0}]

class BrandsResponseEntity {
  BrandsResponseEntity({
      this.message, 
      this.result,});


  String? message;
  List<BrandsEntity>? result;



}

/// logo : {"public_id":"E-Commerce/brand/goegiz86jhh8iinde6vq","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"}
/// _id : "6642350e865c363d952dea8b"
/// name : "Puma"
/// slug : "puma"
/// createdAt : "2024-05-13T15:43:10.834Z"
/// updatedAt : "2024-05-13T15:43:10.834Z"
/// __v : 0

class BrandsEntity {
  BrandsEntity({
      this.logo, 
      this.id, 
      this.name, 
      this.slug, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  BrandsLogoEntity? logo;
  String? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? v;



}

/// public_id : "E-Commerce/brand/goegiz86jhh8iinde6vq"
/// secure_url : "https://res.cloudinary.com/diubywm4o/image/upload/v1715613668/E-Commerce/brand/goegiz86jhh8iinde6vq.avif"

class BrandsLogoEntity {
  BrandsLogoEntity({
      this.publicId, 
      this.secureUrl,});


  String? publicId;
  String? secureUrl;



}