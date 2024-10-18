import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/getCartResponseEntity.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/cart_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/cart_repository_contract.dart';

class CartRepositoryImp implements CartRepositoryContract {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImp({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

}