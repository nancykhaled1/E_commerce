import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_manager.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';
import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/home_remote_datasource.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiManager? apiManager1;
  HomeRemoteDataSourceImp({required this.apiManager1});
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories()async {
     var either = await ApiManager.getCategory();
     return either.fold((error) {
       return Left(Failures(errorMessage: error.errorMessage));
     },
             (response) {
       return Right(response);
     }
     );
  }

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands()async {
    var either = await ApiManager.getBrands();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts()async {
    var either = await ApiManager.getProducts();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) async{
    var either = await ApiManager.addToCart(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

}

