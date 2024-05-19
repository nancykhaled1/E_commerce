/// message : "done"
/// category : [{"logo":{"public_id":"E-Commerce/category/znthrbrmybdrqawkd1tu","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"},"_id":"664239cefc6c4382a680a803","name":"clothes","slug":"clothes","createdAt":"2024-05-13T16:03:26.809Z","updatedAt":"2024-05-13T16:03:26.809Z","__v":0},{"logo":{"public_id":"E-Commerce/category/vyzhd2jzduhavr4fw5qf","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715615616/E-Commerce/category/vyzhd2jzduhavr4fw5qf.jpg"},"_id":"66423cab2474c0f43f82969b","name":"makeup","slug":"makeup","createdAt":"2024-05-13T16:15:39.172Z","updatedAt":"2024-05-13T16:15:39.172Z","__v":0},{"logo":{"public_id":"E-Commerce/category/uvbwi45doipuez8elmam","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715616059/E-Commerce/category/uvbwi45doipuez8elmam.jpg"},"_id":"66423e662474c0f43f8296b7","name":"Home","slug":"home","createdAt":"2024-05-13T16:23:02.581Z","updatedAt":"2024-05-13T16:23:02.581Z","__v":0}]

class CategoryResponseEntity {
  CategoryResponseEntity({
      this.message, 
      this.category,});


  String? message;
  List<CategoryEntity>? category;



}

/// logo : {"public_id":"E-Commerce/category/znthrbrmybdrqawkd1tu","secure_url":"https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"}
/// _id : "664239cefc6c4382a680a803"
/// name : "clothes"
/// slug : "clothes"
/// createdAt : "2024-05-13T16:03:26.809Z"
/// updatedAt : "2024-05-13T16:03:26.809Z"
/// __v : 0

class CategoryEntity {
  CategoryEntity({
      this.logo, 
      this.id, 
      this.name, 
      this.slug, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  CategoryLogoEntity? logo;
  String? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? v;



}

/// public_id : "E-Commerce/category/znthrbrmybdrqawkd1tu"
/// secure_url : "https://res.cloudinary.com/diubywm4o/image/upload/v1715614883/E-Commerce/category/znthrbrmybdrqawkd1tu.jpg"

class CategoryLogoEntity {
  CategoryLogoEntity({
      this.publicId, 
      this.secureUrl,});


  String? publicId;
  String? secureUrl;



}