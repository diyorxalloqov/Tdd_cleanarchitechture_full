import 'package:dartz/dartz.dart';
import 'package:tdd_cached_clean_architechture_full_/core/db/sql_db_service.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

class UserLocalSource {
  Future<Either<Failure, List<UserModel>>> getUsers(int? page) async {
    try {
      final result = await SqlDbService().getUsers();
      print(result);
      return result.fold(
          (l) => left(LocalDbFailure(message: l.toString())), (r) => right(r));
    } catch (e) {
      return left(const Failure());
    }
  }
}
