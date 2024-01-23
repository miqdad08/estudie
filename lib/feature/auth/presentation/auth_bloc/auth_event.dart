part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthEvent {
  final LoginParams param;

  const AuthLogin({required this.param});

  @override
  List<Object?> get props => [param];
}

class AuthGetCurrent extends AuthEvent {}

class AuthLogout extends AuthEvent {}

class AuthRegister extends AuthEvent {
  final RegisterParams param;

  const AuthRegister({required this.param});

  @override
  List<Object?> get props => [param];
}
