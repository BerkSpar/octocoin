import 'package:octocoin/features/auth/data/datasources/auth_datasource.dart';
import 'package:octocoin/features/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class FirebaseDatasource implements AuthDatasource {
  @override
  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await firebase.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('There is no user');
      }

      return User(
        id: credential.user?.uid,
        email: credential.user?.email ?? '',
        username: credential.user?.displayName ?? '',
        imageUrl: credential.user?.photoURL,
      );
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (e) {
      throw Exception(e);
    }

    return null;
  }
}
