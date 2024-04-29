import 'package:e_commerce_project/home/home_screen/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../tabs/fav_tab/fav-tab.dart';
import '../../tabs/home_tab/home-tab.dart';
import '../../tabs/product_tab/product_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeState>{
  HomeScreenViewModel():super(HomeInitialState());
  int selectedIndex =0 ;
  List<Widget> tabs = [
    HomeTab(),
    ProductTab(),
    FavouriteTab(),
    ProfileTab()
  ];

  void changebottomNavigationBar(int newselectedIndex){
    HomeInitialState();
    selectedIndex = newselectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}