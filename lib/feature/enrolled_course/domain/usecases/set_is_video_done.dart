import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/common_util/logger.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_video_is_done/set_video_is_done_param.dart';

import '../../../../core/resources/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../detail_course/domain/entities/video.dart';

class SetVideoIsDoneUseCase extends UseCase<Either<Failure, EnrolledCourseEntity>, SetVideoIsDoneParam> {
  final EnrolledCourseRepository repository;

  SetVideoIsDoneUseCase(this.repository);

  @override
  Future<Either<Failure, EnrolledCourseEntity>> call({SetVideoIsDoneParam? params}) async{
    List<Video> lessons = params!.course.lessons;
    for (int i = 0; i < lessons.length; i++) {
      if (lessons[i].id == params.video.id) {
        lessons[i].isDone = true;
        break;
      }
    }
    int progress = lessons.where((element) => element.isDone == true).length;
    var result = await repository.setIsDoneVideo(course: params.course.copyWith(lessons: lessons, progress: progress));
    return result.fold((failure) => Left(failure), (data) => Right(data));
  }
}
