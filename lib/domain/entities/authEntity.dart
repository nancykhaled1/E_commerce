


import '../../data/model/response/User.dart';
import '../../data/model/response/errors.dart';
import 'UserEntity.dart';
import 'UsersEntity.dart';

/// message : "success"
/// user : {"name":"hasan","email":"hasan7@gmail.com","password":"$2b$07$3FAf0qhQVj1Btfm1Vk/bieHFaRC2VQ5lgkHnSPomQVudFwsc9pWM6","role":"admin","isActive":true,"wishlist":[],"verified":false,"_id":"6648fda9ff4b307e5c4d573c","createdAt":"2024-05-18T19:12:41.297Z","updatedAt":"2024-05-18T19:12:41.297Z","__v":0}

class AuthEntity {
  AuthEntity({
      this.message,
    this.errors,
    this.token,
      this.userEntity,});


  String? message;
  UserEntity? userEntity;
  Errors? errors;
  String? token;



}