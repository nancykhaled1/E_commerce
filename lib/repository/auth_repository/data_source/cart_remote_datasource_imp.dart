import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/getCartResponseEntity.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/cart_remote_datasource.dart';

import '../../../data/api/api_manager.dart';

class CartRemoteDataSourceImp implements CartRemoteDataSource{
  ApiManager? apiManager1;

  CartRemoteDataSourceImp({required this.apiManager1});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await ApiManager.getCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

}