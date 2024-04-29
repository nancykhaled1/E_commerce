import 'package:dartz/dartz.dart';

import '../../data/api/failures.dart';
import '../entities/CategoryOrBrandsResponseEntity.dart';
import '../repository/auth_repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase{
  HomeRepositoryContract repositoryContract;
  GetAllBrandsUseCase({required this.repositoryContract});
  Future<Either<Failures,CategoryOrBrandsResponseEntity>>invoke(){
    return repositoryContract.getAllBrands();
  }
}