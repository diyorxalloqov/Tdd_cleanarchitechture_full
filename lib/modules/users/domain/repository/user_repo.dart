import 'package:dartz/dartz.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getUsers(int? page);
}
