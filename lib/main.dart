import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/feature/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:online_course_app/feature/detail_course/presentation/bloc/detail_course_bloc.dart';
import 'config/routes/route.dart';
import 'config/theme/app_theme.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
          sl()
            ..add(AuthGetCurrent()),
        ),
        BlocProvider(
          create: (context) => DetailCourseBloc(sl(), sl(), sl(), sl()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routerDelegate: AppRoutes.router.routerDelegate,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
      ),
    );
  }
}
