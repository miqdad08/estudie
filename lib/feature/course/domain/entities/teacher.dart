import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String id;
  final String name;
  final String email;
  final String specialist;
  final String? photoUrl;

  const Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.specialist,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, name, email, specialist, photoUrl];
}
