import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String idTeacher;
  final String title;
  final int? price;
  final String category;
  final double rating;
  final String? posterPath;

  const Course({
    required this.id,
    required this.idTeacher,
    required this.title,
    this.price = 0,
    this.posterPath,
    required this.category,
    required this.rating,
  });

  Course copyWith({
    String? id,
    String? idTeacher,
    String? title,
    int? price,
    String? category,
    double? rating,
    String? posterPath,
  }) {
    return Course(
      id: id ?? this.id,
      idTeacher: idTeacher ?? this.idTeacher,
      title: title ?? this.title,
      price: price ?? this.price,
      posterPath: posterPath ?? this.posterPath,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        category,
        rating,
      ];
}
