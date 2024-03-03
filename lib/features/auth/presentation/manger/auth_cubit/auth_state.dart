part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final UserModel user;

  const LoginSuccess({required this.user});
}

final class LoginFailure extends AuthState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final UserModel user;
  const RegisterSuccess({required this.user});
}

final class RegisterFailure extends AuthState {
  final String errMessage;

  const RegisterFailure({required this.errMessage});
}
