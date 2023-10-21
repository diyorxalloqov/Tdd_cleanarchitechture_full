import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tdd_cached_clean_architechture_full_/core/db/sql_db_service.dart';
import 'package:tdd_cached_clean_architechture_full_/core/singleton/dio.dart';
import 'package:tdd_cached_clean_architechture_full_/core/singleton/service_locator.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';

class UserService {
  final dioclient = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, List<UserModel>>> getUsers(int? page) async {
    Map<String, dynamic> data = {};

    if (page != null) {
      data.addAll({"page": page});
    }

    try {
      final response = await dioclient.get("/users", queryParameters: data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<UserModel> data = (response.data['data'] as List<dynamic>)
            .map((e) => UserModel.fromJson(e))
            .toList();
        print(data);
        try {
          SqlDbService().addUsers(data);
        } catch (e) {
          print("$e userService error");
        }
        return right(data);
      } else {
        return left(ServerFailure(message: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      print("$e userservice exeption");
      return left(Failure(message: e.message.toString()));
    }
  }
}
