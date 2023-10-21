import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/source/local_source/user_local_source.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/source/network_source/user_service.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/repository/user_repo.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

class UserRepositoryImpl extends UserRepository {
  final UserService userService = UserService();
  final UserLocalSource userLocalSource = UserLocalSource();

  @override
  Future<Either<Failure, List<UserModel>>> getUsers(int? page) async {
    ConnectivityResult connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.mobile) {
      try {
        final result = await Dio().get('https://www.google.com/');
        if (result.statusCode! >= 200 || result.statusCode! < 300) {
          return userService.getUsers(page);
        } else {
          return userLocalSource.getUsers(page);
        }
      } catch (e) {
        return userLocalSource.getUsers(page);
      }
    } else {
      return userLocalSource.getUsers(page);
    }
  }
}
