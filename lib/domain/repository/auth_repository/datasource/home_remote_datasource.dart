import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/entities/addToCartResponseEntity.dart';

import '../../../../data/api/failures.dart';
import '../../../entities/CategoryOrBrandsResponseEntity.dart';
import '../../../entities/addProductToCartResponseEntity.dart';
import '../../../entities/brandsResponseEntity.dart';
import '../../../entities/categoryResponseEntity.dart';
import '../../../entities/productsResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures,CategoryResponseEntity>>getAllCategories(int pageNum);
  Future<Either<Failures,BrandsResponseEntity>>getAllBrands(int pageNum2);
  Future<Either<Failures,ProductsResponseEntity>>getAllProducts(int pages);
  Future<Either<Failures,AddProductToCartResponseEntity>>addToCart(String productId);



}

abstract class HomeLocalDataSource{
  Future<Either<Failures,CategoryResponseEntity>>getAllCategories(int pageNum);
  Future<Either<Failures,BrandsResponseEntity>>getAllBrands(int pageNum2);
  Future<Either<Failures,ProductsResponseEntity>>getAllProducts(int pages);
  Future<Either<Failures,AddProductToCartResponseEntity>>addToCart(String productId);



}

