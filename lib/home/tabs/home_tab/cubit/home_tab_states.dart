import 'package:e_commerce_project/domain/entities/CategoryOrBrandsResponseEntity.dart';

abstract class HomeTabStates{}
class HomeTabInitialStates extends HomeTabStates{}
class HomeTabLoadingStates extends HomeTabStates{
  String? loadingMessage;
  HomeTabLoadingStates({required this.loadingMessage});
}
class HomeTabErrorStates extends HomeTabStates{
  String? errorMessage;
  HomeTabErrorStates({required this.errorMessage});
}
class HomeTabSuccessStates extends HomeTabStates{

CategoryOrBrandsResponseEntity categoryResponseEntity;
HomeTabSuccessStates({required this.categoryResponseEntity});
}