import 'package:dartz/dartz.dart';

import '../../data/api/failures.dart';
import '../entities/CategoryOrBrandsResponseEntity.dart';
import '../entities/brandsResponseEntity.dart';
import '../entities/categoryResponseEntity.dart';
import '../repository/auth_repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase{
  HomeRepositoryContract repositoryContract;
  GetAllBrandsUseCase({required this.repositoryContract});
  Future<Either<Failures,BrandsResponseEntity>>invoke(int pageNum2){
    return repositoryContract.getAllBrands(pageNum2);
  }
}