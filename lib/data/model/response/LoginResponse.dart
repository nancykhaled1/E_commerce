import 'package:e_commerce_project/data/model/response/UserDto.dart';

import '../../../domain/entities/auth_result_Entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti12@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZGQ2OTZjMTExYzAyYTY3ODE3NTIyOCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NTYxMzI4LCJleHAiOjE3MDczMzczMjh9.rfYvYa50NZ2MN4FsRXAW2-vwgNUxLjQowl0LdCwe9iE"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];

  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
        token: token,
        userEntity: user?.toUserEntity()
    );
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti12@gmail.com"
/// role : "user"

