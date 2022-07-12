import 'package:octocoin/features/auth/domain/entities/user.dart';

abstract class AuthDatasource {
  Future<User> loginWithEmail({
    required String email,
    required String password,
  });
}
