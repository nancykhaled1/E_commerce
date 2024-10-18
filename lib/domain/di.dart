import 'package:e_commerce_project/domain/repository/auth_repository/datasource/auth_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/cart_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/datasource/home_remote_datasource.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/cart_repository_contract.dart';
import 'package:e_commerce_project/domain/repository/auth_repository/repository/home_repository_contract.dart';
import 'package:e_commerce_project/domain/usecase/add_to_cart_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_brands_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_categories_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_all_products_usecase.dart';
import 'package:e_commerce_project/domain/usecase/get_cart_usecase.dart';
import 'package:e_commerce_project/domain/usecase/login_usecase.dart';
import 'package:e_commerce_project/domain/usecase/register_usecase.dart';
import 'package:e_commerce_project/repository/auth_repository/data_source/cart_remote_datasource_imp.dart';
import 'package:e_commerce_project/repository/auth_repository/data_source/home_remote_datasource_imp.dart';
import 'package:e_commerce_project/repository/auth_repository/repository/cart_repository_imp.dart';
import 'package:e_commerce_project/repository/auth_repository/repository/home_repository_imp.dart';
import '../data/api/api_manager.dart';
import '../repository/auth_repository/data_source/auth_remote_datasource_imp.dart';
import '../repository/auth_repository/repository/auth_reposiyory_imp.dart';

AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImp(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager: ApiManager.getInstance());
}

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepository());
}

GetAllCategoryUseCase injectGetAllCategoryUseCase(){
  return GetAllCategoryUseCase(repositoryContract: injectHomeRepositoryContract() );
}

GetAllBrandsUseCase injectGetAllBrandsUseCase(){
  return GetAllBrandsUseCase(repositoryContract: injectHomeRepositoryContract() );
}

HomeRepositoryContract injectHomeRepositoryContract(){
  return HomeRepositoryImp(remoteDataSource: injectHomeRemoteDataSource() );
}

HomeRemoteDataSource injectHomeRemoteDataSource(){
  return HomeRemoteDataSourceImp(apiManager1: ApiManager.getInstance());
}

GetAllProductUseCase injectGetAllProductsUseCase(){
  return GetAllProductUseCase(repositoryContract: injectHomeRepositoryContract() );
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(repositoryContract: injectHomeRepositoryContract());
}

GetCartUseCase injectGetCartUseCase(){
  return GetCartUseCase(repositoryContract: injectCartRepositoryContract());
}


CartRepositoryContract injectCartRepositoryContract(){
  return CartRepositoryImp(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource(){
  return CartRemoteDataSourceImp(apiManager1: ApiManager.getInstance());
}