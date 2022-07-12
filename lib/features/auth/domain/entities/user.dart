import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? imageUrl;
  final String username;
  final String email;

  const User({
    required this.id,
    required this.email,
    required this.username,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
