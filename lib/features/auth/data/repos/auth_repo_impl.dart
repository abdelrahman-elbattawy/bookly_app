import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:bookly_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> loginUser({
    required email,
    required password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(userEmail: email);

      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          ServerFailure.fromFirebase(
            e.code,
          ),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerUser(
      {required email, required password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(userEmail: email);

      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          ServerFailure.fromFirebase(
            e.code,
          ),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
