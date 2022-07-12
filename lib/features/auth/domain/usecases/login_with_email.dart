import 'package:dartz/dartz.dart';
import 'package:octocoin/features/auth/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

abstract class LoginWithEmail {
  Future<Either<Exception, User>> call(
      {required String email, required String password});
}

class LoginWithEmailImpl implements LoginWithEmail {
  final AuthRepository repository;

  LoginWithEmailImpl(this.repository);

  @override
  Future<Either<Exception, User>> call(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      return Left(Exception('Email can\'t be empty'));
    }

    if (password.isEmpty) {
      return Left(Exception('Email can\'t be empty'));
    }

    return await repository.loginWithEmail(email: email, password: password);
  }
}
