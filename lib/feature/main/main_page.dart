import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/common_widget/bottom_navigation/bottom_nav_bar.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/config/theme/app_theme.dart';
import 'package:online_course_app/feature/enrolled_course/presentation/bloc/enrolled_course/enrolled_course_bloc.dart';
import 'package:online_course_app/feature/enrolled_course/presentation/enrolled_course_page.dart';

import '../../common_widget/bottom_navigation/bottom_nav_bar_item.dart';
import '../../injection_container.dart';
import '../auth/presentation/settings_page.dart';
import '../course/presentation/course_bloc/course_bloc.dart';
import '../course/presentation/home_page.dart';

class MainPage extends StatefulWidget {
  static String routeName = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  final routes = [
    const Center(child: HomePage(),),
    const Center(child: EnrolledCoursePage()),
    Center(child: Text('Groups', style: theme.textTheme.titleMedium,),),
    const Center(child: SettingsPage(),),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc(sl(), sl())..add(GetCourses()),
        ),
        BlocProvider(
          create: (context) => EnrolledCourseBloc(sl()),
        ),
        // BlocProvider(
        //   create: (context) => EnrolledCourseDetailBloc(sl()),
        // ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
