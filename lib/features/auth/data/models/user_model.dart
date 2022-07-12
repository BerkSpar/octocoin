import 'package:octocoin/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
    super.imageUrl,
    super.password,
  });
}
