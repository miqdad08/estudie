import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;
  final int? balance;

  const User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.balance,
  });

  @override
  List<Object?> get props => [uid, email, name, photoUrl, balance];
}
