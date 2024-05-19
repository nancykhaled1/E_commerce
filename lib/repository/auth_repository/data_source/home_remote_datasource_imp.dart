import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/api_manager.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/home_remote_datasource.dart';
import '../../../domain/entities/addProductToCartResponseEntity.dart';
import '../../../domain/entities/brandsResponseEntity.dart';
import '../../../domain/entities/categoryResponseEntity.dart';
import '../../../domain/entities/productsResponseEntity.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiManager? apiManager1;
  HomeRemoteDataSourceImp({required this.apiManager1});


  @override
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands(int pageNum2)async {
    var either = await ApiManager.getBrands(pageNum2);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts(int pages)async {
    var either = await ApiManager.getProducts(pages);

    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

  @override
  Future<Either<Failures, AddProductToCartResponseEntity>> addToCart(String productId) async{
    var either = await ApiManager.addToCart(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        }
    );
  }

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories(int pageNum) async {
    var either = await ApiManager.getCategory(pageNum);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
        (response){
      return Right(response);
        }
    );
  }

}

