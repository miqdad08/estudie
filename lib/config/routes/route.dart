import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_widget/video_player/video_player_widget.dart';
import 'package:online_course_app/feature/auth/presentation/sign_in_page.dart';
import 'package:online_course_app/feature/course/domain/entities/teacher.dart';
import 'package:online_course_app/feature/detail_course/presentation/detail_course_page.dart';
import 'package:online_course_app/feature/enrolled_course/presentation/detail_enrolled_course_page.dart';
import 'package:online_course_app/feature/detail_teacher/presentation/detail_teacher_page.dart';
import '../../feature/auth/presentation/sign_up_page.dart';
import '../../feature/auth/presentation/welcome_page.dart';
import '../../feature/course/domain/entities/course.dart';
import '../../feature/main/main_page.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/${WelcomePage.routeName}',
          name: WelcomePage.routeName,
          builder: (context, state) {
            return const WelcomePage();
          },
          routes: [
            GoRoute(
              path: SignInPage.routeName,
              name: SignInPage.routeName,
              builder: (context, state) {
                return const SignInPage();
              },
            ),
            GoRoute(
              path: SignUpPage.routeName,
              name: SignUpPage.routeName,
              builder: (context, state) {
                return const SignUpPage();
              },
            ),
          ]),
      GoRoute(
        path: '/${MainPage.routeName}',
        name: MainPage.routeName,
        builder: (context, state) {
          return const MainPage();
        },
        routes: [
          GoRoute(
            path: DetailCoursePage.routeName,
            name: DetailCoursePage.routeName,
            builder: (context, state) {
              return DetailCoursePage(courseData: state.extra as Course);
            },
          ),
          GoRoute(
            path: DetailTeacherPage.routeName,
            name: DetailTeacherPage.routeName,
            builder: (context, state) {
              return DetailTeacherPage(teacher: state.extra as Teacher);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/${DetailEnrolledCoursePage.routeName}',
        name: DetailEnrolledCoursePage.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: DetailEnrolledCoursePage(
              arguments: state.extra as DetailEnrolledCourseArguments,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
    ],
    initialLocation: '/${WelcomePage.routeName}',
    debugLogDiagnostics: true,
  );
}
