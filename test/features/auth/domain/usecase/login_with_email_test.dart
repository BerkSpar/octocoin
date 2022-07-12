import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:octocoin/features/auth/domain/entities/user.dart';
import 'package:octocoin/features/auth/domain/repositories/auth_repository.dart';
import 'package:octocoin/features/auth/domain/usecases/login_with_email.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([AuthRepository])
import 'login_with_email.mocks.dart';

void main() {
  final repository = MockAuthRepository();
  final usecase = LoginWithEmailImpl(repository);

  test('Should return a user when login with email', () async {
    when(repository.loginWithEmail(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer(
        (_) async => right(const User(id: '', email: '', username: '')));

    final result = await usecase(
      email: 'test@test.com',
      password: 'password.test',
    );

    expect(result.isRight(), true);
  });

  test('Can\'t login with email without email', () async {
    when(repository.loginWithEmail(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer(
        (_) async => right(const User(id: '', email: '', username: '')));

    final result = await usecase(
      email: '',
      password: 'password.test',
    );

    expect(result.isLeft(), true);
  });

  test('Can\'t login with email without password', () async {
    when(repository.loginWithEmail(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer(
        (_) async => right(const User(id: '', email: '', username: '')));

    final result = await usecase(
      email: '',
      password: 'password.test',
    );

    expect(result.isLeft(), true);
  });
}
