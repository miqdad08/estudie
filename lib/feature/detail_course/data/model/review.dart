import '../../domain/entities/review.dart';

class ReviewModel {
  final String? id;
  final String? uid;
  final String? nameUser;
  final String review;
  final int time;
  final double rating;

  ReviewModel({
     this.id,
    required this.uid,
    required this.nameUser,
    required this.review,
    required this.time,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      uid: json['uid'] ?? '',
      nameUser: json["nameUser"],
      review: json["review"],
      time: json["time"],
      rating: double.parse(json["rating"].toString()),
    );
  }

  Review toEntity() {
    return Review(
      id: id,
      uid: uid,
      nameUser: nameUser,
      review: review,
      time: time,
      rating: rating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'nameUser': nameUser,
      'review': review,
      'time': time,
      'rating': rating,
    };
  }

  factory ReviewModel.fromEntity(Review review) {
    return ReviewModel(
      id: review.id,
      uid: review.uid,
      nameUser: review.nameUser,
      review: review.review,
      time: review.time,
      rating: review.rating,
    );
  }
}
