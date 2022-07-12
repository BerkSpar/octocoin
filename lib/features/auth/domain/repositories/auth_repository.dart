import 'package:dartz/dartz.dart';
import 'package:octocoin/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Exception, User>> loginWithEmail({
    required String email,
    required String password,
  });
}
