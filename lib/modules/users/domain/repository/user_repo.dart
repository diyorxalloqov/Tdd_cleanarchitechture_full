import 'package:dartz/dartz.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/entity/user_entity.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers(int? page);
}
