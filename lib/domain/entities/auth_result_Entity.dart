import 'package:e_commerce_project/domain/entities/UserEntity.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity,this.token});
}