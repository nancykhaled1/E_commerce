import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/api/failures.dart';
import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';

import '../../../entities/addToCartResponseEntity.dart';
import '../../../entities/productResponseEntity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllCategories();
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>getAllBrands();
  Future<Either<Failures,ProductResponseEntity>>getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId);





}