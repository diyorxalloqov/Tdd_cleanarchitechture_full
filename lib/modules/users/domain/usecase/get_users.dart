import 'package:dartz/dartz.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/repository/user_repo.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/usecase.dart';

class GetUsersUsecase extends UseCase<List<UserModel>, int?> {
  final UserRepository repo;
  GetUsersUsecase({required this.repo});

  @override
  Future<Either<Failure, List<UserModel>>> call(int? params) {
    return repo.getUsers(params);
  }
}
