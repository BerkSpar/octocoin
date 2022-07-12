import 'package:octocoin/features/auth/data/datasources/auth_datasource.dart';
import 'package:octocoin/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:octocoin/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, User>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final result =
          await datasource.loginWithEmail(email: email, password: password);

      if (result != null) {
        return right(result);
      } else {
        return left(Exception('There is no user'));
      }
    } on Exception catch (e) {
      return left(e);
    }
  }
}
