import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/home_repository_contract.dart';

import '../../data/api/failures.dart';
import '../entities/categoryResponseEntity.dart';

class GetAllCategoryUseCase {
  //repository
  HomeRepositoryContract repositoryContract;
  GetAllCategoryUseCase({required this.repositoryContract});
  Future<Either<Failures,CategoryResponseEntity>>invoke(int pageNum){
    return repositoryContract.getAllCategories(pageNum);
  }
}