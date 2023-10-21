import 'package:dio/dio.dart';

class DioSettings {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: "https://reqres.in/api",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  BaseOptions get baseOptions => _baseOptions;

  Dio get dio {
    Dio dio1 = Dio(_baseOptions);

    return dio1;
  }
}
