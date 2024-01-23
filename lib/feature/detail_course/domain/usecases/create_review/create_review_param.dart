import '../../entities/review.dart';

class CreateReviewParam {
  final Review review;
  final String id;

  CreateReviewParam({
    required this.id,
    required this.review,
  });
}
