import 'package:dartz/dartz.dart';

import '../../data/api/failures.dart';
import '../entities/getCartResponseEntity.dart';
import '../repository/auth_repository/repository/cart_repository_contract.dart';

class GetCartUseCase{
  CartRepositoryContract repositoryContract;

  GetCartUseCase({required this.repositoryContract});

  Future<Either<Failures,GetCartResponseEntity>>invoke(){
    return repositoryContract.getCart();
  }
}