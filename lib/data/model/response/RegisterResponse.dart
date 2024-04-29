import 'package:e_commerce_project/domain/entities/auth_result_Entity.dart';
import 'package:e_commerce_project/data/model/response/Error.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti2000@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Y2YTdmNjJlMTg4YTMzMTM4ZTdhYSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NjU0ODQ4LCJleHAiOjE3MDY0MzA4NDh9.5v_Gnln7IVsvpTEftBaPtsQuZkOxDQVnQC10mA7piZM"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user,
    this.error,
    this.statusMsg,
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['errors'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  Error? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
 AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
 }
}