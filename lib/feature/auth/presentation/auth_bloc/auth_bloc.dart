import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/auth/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:online_course_app/feature/auth/domain/usecases/login/login_params.dart';
import 'package:online_course_app/feature/auth/domain/usecases/logout/logout.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login/login.dart';
import '../../domain/usecases/register/register.dart';
import '../../domain/usecases/register/register_params.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Register _register;
  final GetLoggedInUser _getLoggedInUser;
  final Login _login;
  final Logout _logout;

  AuthBloc(this._register, this._getLoggedInUser, this._login, this._logout)
      : super(AuthInitial()) {
    on<AuthLogin>(onAuthLogin);
    on<AuthRegister>(onAuthRegister);
    on<AuthGetCurrent>(onAuthGetCurrent);
    on<AuthLogout>(onAuthLogout);
  }

  void onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _login(params: event.param);
    result.fold(
      (failure) => emit(AuthFailed(message: failure.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  void onAuthRegister(AuthRegister event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _register(params: event.param);
    result.fold(
      (failed) => emit(AuthFailed(message: failed.message)),
      (data) => emit(
        AuthSuccess(user: data),
      ),
    );
  }

  void onAuthGetCurrent(AuthGetCurrent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _getLoggedInUser();
    result.fold(
      (failed) => emit(AuthFailed(message: failed.message)),
      (data) => emit(
        AuthSuccess(user: data),
      ),
    );
  }

  void onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _logout();
    result.fold(
      (failed) => emit(AuthFailed(message: failed.message)),
      (data) => emit(
        AuthInitial()
      ),
    );
  }
}
