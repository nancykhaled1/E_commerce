import 'package:dartz/dartz.dart';

import '../../data/api/failures.dart';
import '../entities/productResponseEntity.dart';
import '../entities/productsResponseEntity.dart';
import '../repository/auth_repository/repository/home_repository_contract.dart';

class GetAllProductUseCase {
  //repository
  HomeRepositoryContract repositoryContract;
  GetAllProductUseCase({required this.repositoryContract});
  Future<Either<Failures,ProductsResponseEntity>>invoke(int pages){
    return repositoryContract.getAllProducts(pages);
  }
}