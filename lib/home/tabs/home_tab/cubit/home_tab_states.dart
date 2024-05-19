
import '../../../../domain/entities/brandsResponseEntity.dart';
import '../../../../domain/entities/categoryResponseEntity.dart';

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
//CategoryEntity categoryEntity;
  BrandsResponseEntity brandEntity;
HomeTabSuccessStates({required this.brandEntity});
}
class HomeSuccessStates extends HomeTabStates{
  CategoryResponseEntity categoryEntity;
 // CategoryOrBrandsResponseEntity categoryResponseEntity;
  HomeSuccessStates({required this.categoryEntity});
}