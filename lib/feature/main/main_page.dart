import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/bottom_navigation/bottom_nav_bar.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/config/theme/app_theme.dart';
import 'package:online_course_app/feature/home/presentation/home_page.dart';

import '../../common_widget/bottom_navigation/bottom_nav_bar_item.dart';

class MainPage extends StatefulWidget {
  static String routeName = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController();

  final routes= [
    const Center(child: HomePage(),),
    Center(child: Text('Library', style: theme.textTheme.titleMedium,),),
    Center(child: Text('Groups', style: theme.textTheme.titleMedium,),),
    Center(child: Text('Settings', style: theme.textTheme.titleMedium,),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          routes[selectedPage],
          // PageView(
          //   physics: const NeverScrollableScrollPhysics(),
          //   controller: pageController,
          //   onPageChanged: (index) {},
          //   children: [
          //     const Center(child: HomePage(),),
          //     Center(child: Text('Library', style: theme.textTheme.titleMedium,),),
          //     Center(child: Text('Groups', style: theme.textTheme.titleMedium,),),
          //     Center(child: Text('Settings', style: theme.textTheme.titleMedium,),),
          //   ],
          // ),
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
              // pageController.animateToPage(
              //   selectedPage,
              //   duration: const Duration(milliseconds: 200),
              //   curve: Curves.easeInOut,
              // );
              setState(() {});
            },
            selectedIndex: selectedPage,
          ),
        ],
      ),
    );
  }
}
