import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/home_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/home_repository_contract.dart';
import '../../../domain/entities/addProductToCartResponseEntity.dart';
import '../../../domain/entities/brandsResponseEntity.dart';
import '../../../domain/entities/categoryResponseEntity.dart';
import '../../../domain/entities/productsResponseEntity.dart';

class HomeRepositoryImp implements HomeRepositoryContract{
  HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories(int pageNum) {
    return remoteDataSource.getAllCategories(pageNum);
  }

  @override
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands(int pageNum2) {
    return remoteDataSource.getAllBrands(pageNum2);
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts(int pages) {
    return remoteDataSource.getAllProducts(pages);
  }

  @override
  Future<Either<Failures, AddProductToCartResponseEntity>> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);
  }
}