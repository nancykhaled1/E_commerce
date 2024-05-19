import '../../../domain/entities/authEntity.dart';
import 'User.dart';
import 'errors.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiaGFzIiwidXNlcklkIjoiNjYzZjljMTMzNzAwYzE4NTBlMzZmNzE1Iiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzE2MDY1OTM2fQ.P-zZOD1Kd0-OQpQTMvaPAw6RVkq7u9kZ2x93p-cxtco"

class LoginDto {
  LoginDto({
    this.errors,
    this.user,
      this.message, 
      this.token,});

  LoginDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['err'] != null ? Errors.fromJson(json['err']) : null;


  }
  String? message;
  String? token;
  UserDto? user;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;


    return map;
  }
  AuthEntity toAuthResultEntity() {
    return AuthEntity(
        token: token,
        userEntity: user?.toUserEntity()
    );
  }
}