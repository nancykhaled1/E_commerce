import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';
import 'package:e_commerce_project/domain/entities/productResponseEntity.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/home_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/home_repository_contract.dart';
import 'package:e_commerce_project/repository/auth_repository/data_source/home_remote_datasource_imp.dart';

class HomeRepositoryImp implements HomeRepositoryContract{
  HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);
  }
}