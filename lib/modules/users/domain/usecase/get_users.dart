import 'package:dartz/dartz.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/entity/user_entity.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/repository/user_repo.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/usecase.dart';

class GetUsersUsecase extends UseCase<List<UserEntity>, int?> {
  final UserRepository repo;
  GetUsersUsecase({required this.repo});

  @override
  Future<Either<Failure, List<UserEntity>>> call(int? params) {
    return repo.getUsers(params);
  }
}
