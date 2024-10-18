import '../../../domain/entities/UsersEntity.dart';

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

class UserDto {
  UserDto({
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

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    isActive = json['isActive'];
    // // if (json['wishlist'] != null) {
    // //   wishlist = [];
    // //   json['wishlist'].forEach((v) {
    // //     wishlist?.add(Dynamic.fromJson(v));
    // //   });
    // }
    verified = json['verified'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['isActive'] = isActive;
    if (wishlist != null) {
      map['wishlist'] = wishlist?.map((v) => v.toJson()).toList();
    }
    map['verified'] = verified;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
  UserEntity toUserEntity(){
    return UserEntity(
        email: email,
        name: name,
    );}
}