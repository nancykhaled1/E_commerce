/// name : "hasan"
/// email : "hasan7@gmail.com"
/// password : "$2b$07$3FAf0qhQVj1Btfm1Vk/bieHFaRC2VQ5lgkHnSPomQVudFwsc9pWM6"
/// role : "admin"
/// isActive : true
/// wishlist : []
/// verified : false
/// _id : "6648fda9ff4b307e5c4d573c"
/// createdAt : "2024-05-18T19:12:41.297Z"
/// updatedAt : "2024-05-18T19:12:41.297Z"
/// __v : 0

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.password, 
      this.role, 
      this.isActive, 
      this.wishlist, 
      this.verified, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});


  String? name;
  String? email;
  String? password;
  String? role;
  bool? isActive;
  List<dynamic>? wishlist;
  bool? verified;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;



}