import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';

import '../../data/api/failures.dart';
import '../repository/auth_repository/repository/home_repository_contract.dart';

class AddToCartUseCase {
  HomeRepositoryContract repositoryContract;

  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return repositoryContract.addToCart(productId);
  }
}