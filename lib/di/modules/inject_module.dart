import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:moviex/utils/http_client.dart';

@module
abstract class InjectModules {
  @lazySingleton
  @preResolve
  Future<Dio> get client => httpClient();

  @lazySingleton
  Box get box => Hive.box('watchlist');
}
