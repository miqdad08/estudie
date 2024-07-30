import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/repository/detail_course_repository.dart';


class GetDiscussionsUseCase
    extends UseCase<Either<Failure, List<Discussion>>, String> {
  final DetailCourseRepository repository;

  GetDiscussionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Discussion>>> call({String? params}) async{
    return await repository.getDetailDiscussion(params!);
  }
}
