import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import '../../repository/detail_course_repository.dart';
import 'create_discussion_param.dart';

class CreateDiscussionUseCase
    implements UseCase<Either<Failure, void>, CreateDiscussionParam> {
  final DetailCourseRepository repository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  CreateDiscussionUseCase(
      this.repository, this.userRepository, this.authRepository);

  @override
  Future<Either<Failure, void>> call({CreateDiscussionParam? params}) async {
    int discussionTime = DateTime.now().millisecondsSinceEpoch;
    String? loggedInUser = authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var userResult = await userRepository.getUser(uid: loggedInUser);
      return userResult.fold(
        (failure) => Left(failure),
        (data) async {
          var result = await repository.createDiscussion(
            fileAttachments: params!.fileAttachments,
            discussion: params.discussion.copyWith(
              uid: loggedInUser,
              nameUser: data.name,
              time: discussionTime,
              photoUser: data.photoUrl,
              id: (params.discussion.id == null)
                  ? 'idDsc-$discussionTime-$loggedInUser'
                  : params.discussion.id,
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
