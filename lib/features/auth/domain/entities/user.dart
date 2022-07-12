import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? imageUrl;
  final String username;
  final String? password;
  final String email;

  const User({
    required this.id,
    required this.email,
    required this.username,
    this.imageUrl,
    this.password,
  });

  @override
  List<Object?> get props => [id];
}
