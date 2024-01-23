import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String? id;
  final String? uid;
  final String? nameUser;
  final String review;
  final int time;
  final double rating;

  const Review({
    this.id,
    this.uid,
    this.nameUser,
    required this.review,
    required this.time,
    required this.rating,
  });

  Review copyWith({
    String? id,
    String? uid,
    String? nameUser,
    String? review,
    int? time,
    double? rating,
  }) {
    return Review(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      nameUser: nameUser ?? this.nameUser,
      review: review ?? this.review,
      time: time ?? this.time,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [nameUser, review, time, rating];
}
