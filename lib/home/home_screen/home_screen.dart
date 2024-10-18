import 'package:e_commerce_project/home/home_screen/cubit/home_screen_viewmodel.dart';
import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget{
  static const routeName = 'home';

 var viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
        listener: (context,state){
        },
      builder: (context ,state){
        return Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: MyTheme.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: viewModel.selectedIndex,
              onTap: (index) {
                viewModel.changebottomNavigationBar(index);
              },
              items:  [
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 0 ? MyTheme.primaryColor : MyTheme.whiteColor ,
                      backgroundColor: viewModel.selectedIndex == 0 ? MyTheme.whiteColor : Colors.transparent ,
                      radius: 20.r,
                      child: ImageIcon(
                          size: 40.sp,
                          AssetImage(
                              'assets/images/homeicon.png'
                          )
                      ),

                    ),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 1 ? MyTheme.primaryColor : MyTheme.whiteColor ,
                      backgroundColor: viewModel.selectedIndex == 1 ? MyTheme.whiteColor : Colors.transparent ,
                      radius: 20.r,
                      child: ImageIcon(
                          size: 40.sp,
                          AssetImage(
                              'assets/images/categoryicon.png'
                          )
                      ),

                    ),
                    label: 'Category'
                ),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 2 ? MyTheme.primaryColor : MyTheme.whiteColor ,
                      backgroundColor: viewModel.selectedIndex == 2 ? MyTheme.whiteColor : Colors.transparent ,
                      radius: 20.r,
                      child: ImageIcon(
                          size: 40.sp,
                          AssetImage(
                              'assets/images/fav_icon.png'
                          )
                      ),

                    ),
                    label: 'Favourite'
                ),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      foregroundColor: viewModel.selectedIndex == 3 ? MyTheme.primaryColor : MyTheme.whiteColor ,
                      backgroundColor: viewModel.selectedIndex == 3 ? MyTheme.whiteColor : Colors.transparent ,
                      radius: 20.r,
                      child: ImageIcon(
                          size: 40.sp,
                          AssetImage(
                              'assets/images/percon_icon.png'
                          )
                      ),

                    ),
                    label: 'My Account'
                ),
              ],

            ),
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );

      },


    );

  }
}