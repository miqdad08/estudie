import 'package:get_it/get_it.dart';
import 'package:online_course_app/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:online_course_app/feature/auth/data/data_sources/firebase_auth_service.dart';
import 'package:online_course_app/feature/auth/data/data_sources/firebase_user_service.dart';
import 'package:online_course_app/feature/auth/data/data_sources/user_data_source.dart';
import 'package:online_course_app/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:online_course_app/feature/auth/data/repository/user_repository_impl.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import 'package:online_course_app/feature/auth/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:online_course_app/feature/auth/domain/usecases/logout/logout.dart';
import 'package:online_course_app/feature/auth/domain/usecases/register/register.dart';
import 'package:online_course_app/feature/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:online_course_app/feature/course/data/data_source/firebase_course_service.dart';
import 'package:online_course_app/feature/course/data/repository/course_repository_impl.dart';
import 'package:online_course_app/feature/course/domain/repository/course_repository.dart';
import 'package:online_course_app/feature/course/domain/usecases/get_courses.dart';
import 'package:online_course_app/feature/course/domain/usecases/get_teachers.dart';
import 'package:online_course_app/feature/course/presentation/course_bloc/course_bloc.dart';
import 'package:online_course_app/feature/course/presentation/teacher_bloc/teacher_bloc.dart';
import 'package:online_course_app/feature/detail_course/data/data_source/firebase_detail_course_service.dart';
import 'package:online_course_app/feature/detail_course/data/repository/detail_course_repository_impl.dart';
import 'package:online_course_app/feature/detail_course/domain/repository/detail_course_repository.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_review/create_review.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/get_detail_course.dart';
import 'package:online_course_app/feature/detail_course/presentation/bloc/detail_course_bloc.dart';
import 'package:online_course_app/feature/detail_teacher/data/data_source/firebase_detail_teacher_service.dart';
import 'package:online_course_app/feature/detail_teacher/data/repository/detail_teacher_repository_impl.dart';
import 'package:online_course_app/feature/detail_teacher/domain/repository/detail_teacher_repository.dart';
import 'package:online_course_app/feature/detail_teacher/domain/usecases/get_courses.dart';
import 'package:online_course_app/feature/detail_teacher/presentation/detail_teacher_bloc/detail_teacher_bloc.dart';
import 'package:online_course_app/feature/enrolled_course/data/data_source/firebase_enrolled_course_service.dart';
import 'package:online_course_app/feature/enrolled_course/data/repository/enrolled_course_repository_impl.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/create_enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/get_enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_is_video_done.dart';
import 'package:online_course_app/feature/enrolled_course/presentation/bloc/enrolled_course/enrolled_course_bloc.dart';
import 'package:online_course_app/feature/enrolled_course/presentation/bloc/enrolled_course_detail/enrolled_course_detail_bloc.dart';

import 'feature/auth/domain/usecases/login/login.dart';
import 'feature/detail_course/data/data_source/detail_course_data_source.dart';
import 'feature/detail_course/domain/usecases/unlock_course.dart';
import 'feature/enrolled_course/data/data_source/enrolled_course_data_source.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Service
  sl.registerSingleton<DetailDataSource>(FirebaseDetailCourseService());
  sl.registerSingleton<UserDataSource>(FirebaseUserService());
  sl.registerSingleton<AuthDataSource>(FirebaseAuthService());
  sl.registerLazySingleton<FirebaseCourseService>(
      () => FirebaseCourseService());
  sl.registerLazySingleton<FirebaseDetailTeacherService>(
      () => FirebaseDetailTeacherService());
  sl.registerLazySingleton<EnrolledCourseDataSource>(
      () => FirebaseEnrolledCourseService());

  //Repository
  sl.registerSingleton<CourseRepository>(CourseRepositoryImpl(sl()));
  sl.registerSingleton<DetailCourseRepository>(
      DetailCourseRepositoryImpl(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<DetailTeacherRepository>(
      DetailTeacherRepositoryImpl(sl()));
  sl.registerSingleton<EnrolledCourseRepository>(
      EnrolledCourseRepositoryImpl(sl()));

  //UseCase
  sl.registerSingleton<Register>(
      Register(authRepository: sl(), userRepository: sl()));

  sl.registerSingleton<Login>(
      Login(authRepository: sl(), userRepository: sl()));

  sl.registerSingleton<GetDetailCourseUseCase>(GetDetailCourseUseCase(sl()));
  sl.registerSingleton<GetLoggedInUser>(GetLoggedInUser(sl(), sl()));

  sl.registerSingleton<GetCoursesUseCase>(GetCoursesUseCase(sl()));
  sl.registerSingleton<GetTeachersUseCase>(GetTeachersUseCase(sl()));
  sl.registerSingleton<Logout>(Logout(sl()));
  sl.registerSingleton<GetCoursesByTeacherUseCase>(
      GetCoursesByTeacherUseCase(sl()));
  sl.registerSingleton<CreateDiscussionUseCase>(
      CreateDiscussionUseCase(sl(), sl(), sl()));

  sl.registerSingleton<CreateReviewUseCase>(
      CreateReviewUseCase(sl(), sl(), sl()));

  sl.registerSingleton<UnlockCourseUseCase>(UnlockCourseUseCase(sl(), sl(),sl()));

  sl.registerSingleton<CreateEnrolledCourseUseCase>(
      CreateEnrolledCourseUseCase(sl(), sl()));


  sl.registerSingleton<GetEnrolledCoursesUseCase>(
      GetEnrolledCoursesUseCase(sl(), sl()));
  sl.registerSingleton<SetVideoIsDoneUseCase>(
      SetVideoIsDoneUseCase(sl()));

  //Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl(), sl()));

  sl.registerFactory<DetailCourseBloc>(
      () => DetailCourseBloc(sl(), sl(), sl(), sl()));

  sl.registerFactory<CourseBloc>(() => CourseBloc(sl()));
  sl.registerFactory<TeacherBloc>(() => TeacherBloc(sl()));
  sl.registerFactory<DetailTeacherBloc>(() => DetailTeacherBloc(sl()));
  sl.registerFactory<EnrolledCourseBloc>(() => EnrolledCourseBloc(sl()));
  sl.registerFactory<EnrolledCourseDetailBloc>(() => EnrolledCourseDetailBloc(sl()));
}
