import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String name;
  final String email;
  final String specialist;
  final String? photoUrl;

  const Teacher({
    required this.name,
    required this.email,
    required this.specialist,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [name, email, specialist, photoUrl];
}
