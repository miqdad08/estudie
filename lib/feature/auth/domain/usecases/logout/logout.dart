import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';

class Logout extends UseCase<Either<Failure, void>, void>{
  final AuthRepository _repository;

  Logout(this._repository);

  @override
  Future<Either<Failure, void>> call({void params}) async{
    return await _repository.logout();
  }

}