import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:octocoin/features/auth/data/datasources/auth_datasource.dart';
import 'package:octocoin/features/auth/data/repositories/auth_repository.dart';

@GenerateMocks([AuthDatasource])
import 'auth_repository_test.mocks.dart';

void main() {
  final datasource = MockAuthDatasource();
  final repository = AuthRepositoryImpl(datasource);

  test('Need to return a exception when error', () async {
    when(datasource.loginWithEmail(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenThrow(Exception());

    final result = await repository.loginWithEmail(
      email: 'test@test.com',
      password: 'password.test',
    );

    expect(result.isLeft(), true);
  });
}
