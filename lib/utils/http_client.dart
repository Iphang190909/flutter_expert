import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'constant.dart';

Future<Dio> httpClient() async {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  ));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.queryParameters['api_key'] = apiKey;
      return handler.next(options);
    },
  ));

  List<int> file = [];
  file = (await rootBundle.load('certificates/certificates.pem'))
      .buffer
      .asUint8List();

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    SecurityContext sc = SecurityContext();
    sc.setTrustedCertificates(file.join());
    HttpClient httpClient = HttpClient(context: sc);
    return httpClient;
  };
  return dio;
}
