import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String title;
  final String category;
  final int rating;
  final String? posterPath;

  const Course({
    required this.id,
    required this.title,
    this.posterPath,
    required this.category,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        category,
        rating,
      ];
}
