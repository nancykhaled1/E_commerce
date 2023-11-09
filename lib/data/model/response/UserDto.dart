import 'package:e_commerce_project/domain/entities/UserEntity.dart';

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti2000@gmail.com"
/// role : "user"

class UserDto {
  UserDto({
      this.name, 
      this.email, 
      });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];

  }
  String? name;
  String? email;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;

    return map;
  }
UserEntity toUserEntity(){
    return UserEntity(
      email: email,
      name: name
    );
}
}