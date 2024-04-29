import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';

import '../../../../data/api/failures.dart';
import '../../../entities/CategoryOrBrandsResponseEntity.dart';
import '../../../entities/productResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllCategories();
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllBrands();
  Future<Either<Failures,ProductResponseEntity>>getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId);



}

abstract class HomeLocalDataSource{
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllCategories();
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllBrands();
  Future<Either<Failures,ProductResponseEntity>>getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId);



}

