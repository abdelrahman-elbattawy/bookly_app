import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> registerUser(
      {required email, required password});
  Future<Either<Failure, UserModel>> loginUser(
      {required email, required password});
}
