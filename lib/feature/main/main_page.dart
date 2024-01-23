import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/bottom_navigation/bottom_nav_bar.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import '../../common_widget/bottom_navigation/bottom_nav_bar_item.dart';
import '../auth/presentation/settings_page.dart';
import '../course/presentation/home_page.dart';

class MainPage extends StatefulWidget {
  static String routeName = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  final routes= [
    const Center(child: HomePage(),),
    Center(child: Text('Library', style: theme.textTheme.titleMedium,),),
    Center(child: Text('Groups', style: theme.textTheme.titleMedium,),),
    const Center(child: SettingsPage(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          routes[selectedPage],
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: selectedPage == 0,
                title: 'Progress',
                image: IconsConstants.icNavProgress,
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: selectedPage == 1,
                title: 'Library',
                image: IconsConstants.icNavLibrary,
              ),
              BottomNavBarItem(
                index: 2,
                isSelected: selectedPage == 2,
                title: 'Groups',
                image: IconsConstants.icNavGroups,
              ),
              BottomNavBarItem(
                index: 3,
                isSelected: selectedPage == 3,
                title: 'Settings',
                image: IconsConstants.icNavSettings,
              ),
            ],
            onTap: (int index) {
              selectedPage = index;
              setState(() {});
            },
            selectedIndex: selectedPage,
          ),
        ],
      ),
    );
  }
}
