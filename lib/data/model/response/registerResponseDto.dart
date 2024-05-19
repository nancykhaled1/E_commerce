import '../../../domain/entities/authEntity.dart';
import 'User.dart';
import 'errors.dart';

/// message : "success"
/// user : {"name":"khaled","email":"khaledhendawy91@gmail.com","password":"$2b$07$kY5ldkPnubKF1Ldeepi/KueswoNXHtHsRl18vxSBubYy702bBdG5W","role":"user","isActive":true,"wishlist":[],"verified":false,"_id":"6649ae39fc76079de7211647","createdAt":"2024-05-19T07:46:01.607Z","updatedAt":"2024-05-19T07:46:01.607Z","__v":0}

class RegisterResponseDto {
  RegisterResponseDto({
    this.errors,
      this.message, 
      this.user,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['err'] != null ? Errors.fromJson(json['err']) : null;
  }
  String? message;
  UserDto? user;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

 AuthEntity toAuthResultEntity(){
    return AuthEntity(
     // token: token,
      userEntity: user?.toUserEntity()
    );
 }
}



/// name : "khaled"
/// email : "khaledhendawy91@gmail.com"
/// password : "$2b$07$kY5ldkPnubKF1Ldeepi/KueswoNXHtHsRl18vxSBubYy702bBdG5W"
/// role : "user"
/// isActive : true
/// wishlist : []
/// verified : false
/// _id : "6649ae39fc76079de7211647"
/// createdAt : "2024-05-19T07:46:01.607Z"
/// updatedAt : "2024-05-19T07:46:01.607Z"
/// __v : 0

