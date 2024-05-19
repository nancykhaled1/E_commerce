

import 'dart:core';

import 'package:e_commerce_project/utils/my_theme.dart';
import 'package:flutter/material.dart';

import '../../../ui/auth/login/login.dart';
import '../../../utils/shared_preference.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profile';
  const ProfileTab({super.key});
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25
                  ),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text(
                    "Mary Watson Rai",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "marywatson@gmail.com",
                    style: TextStyle(
                      color: Color(0xffE66F51),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: Image.asset("assets/images/prof.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-1, -1),
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      width: 370,
                      height: 420,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gerneral",
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      color: Color(0xffBDBDBD),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Edit profile",
                                      style: TextStyle(
                                        color: Color(0xffBDBDBD),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Color(0xffF2A361),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.notifications_outlined,
                                      color: Color(0xffBDBDBD),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Notifications",
                                      style: TextStyle(
                                        color: Color(0xffBDBDBD),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Color(0xffF2A361),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: Color(0xffBDBDBD),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Language",
                                      style: TextStyle(
                                        color: Color(0xffBDBDBD),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Color(0xffF2A361),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.security,
                                      color: Color(0xffBDBDBD),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Security",
                                      style: TextStyle(
                                        color: Color(0xffBDBDBD),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.navigate_next,
                                    color: Color(0xffF2A361),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Icon(
                                    Icons.logout,
                                    color: Color(0xffE33629),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    SharedPreferenceUtils.removeData('Token');
                                    Navigator.pushReplacementNamed(context,
                                        LoginScreen.routeName);
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: Color(0xffE33629),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -5,
                      child: Image.asset(
                        "assets/images/westack.png",
                        width: 250,
                        height: 170,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
