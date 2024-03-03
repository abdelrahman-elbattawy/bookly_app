import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:bookly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepoImpl) : super(AuthInitial());

  final AuthRepoImpl _authRepoImpl;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var results = await _authRepoImpl.loginUser(
      email: email,
      password: password,
    );

    results.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    var results = await _authRepoImpl.registerUser(
      email: email,
      password: password,
    );

    results.fold(
      (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
      (user) => emit(RegisterSuccess(user: user)),
    );
  }
}
