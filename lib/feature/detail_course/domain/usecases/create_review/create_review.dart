import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_review/create_review_param.dart';
import '../../repository/detail_course_repository.dart';

class CreateReviewUseCase
    implements UseCase<Either<Failure, void>, CreateReviewParam> {
  final DetailCourseRepository repository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  CreateReviewUseCase(
      this.repository, this.userRepository, this.authRepository);

  @override
  Future<Either<Failure, void>> call({CreateReviewParam? params}) async {
    int discussionTime = DateTime.now().millisecondsSinceEpoch;
    String? loggedInUser = authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var userResult = await userRepository.getUser(uid: loggedInUser);
      return userResult.fold(
            (failure) => Left(failure),
            (data) async {
          var result = await repository.createReview(
            review: params!.review.copyWith(
              uid: loggedInUser,
              nameUser: data.name,
              time: discussionTime,
              id: (params.review.id == null)
                  ? 'idRvw-$discussionTime-$loggedInUser'
                  : params.review.id,
            ),
            id: params.id,
          );
          return result.fold(
                  (failure) => Left(failure), (data) => const Right(null));
        },
      );
    } else {
      return Left(Failure(message: 'No user logged in'));
    }
  }
}
