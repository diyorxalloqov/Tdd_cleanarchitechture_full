import 'package:get_it/get_it.dart';
import 'package:tdd_cached_clean_architechture_full_/core/singleton/dio.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator()async{
  serviceLocator.registerLazySingleton(DioSettings.new);
}
