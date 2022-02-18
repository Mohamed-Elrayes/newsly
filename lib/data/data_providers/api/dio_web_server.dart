import 'package:dio/dio.dart';

class DioWebServer {
  Dio dio = Dio();

  DioWebServer({required String baseUrlName}) {
    dio
      ..options.baseUrl = baseUrlName
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..options.receiveDataWhenStatusError = true
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
  }
  static const _defaultConnectTimeout = Duration.millisecondsPerMinute;
  static const _defaultReceiveTimeout = Duration.millisecondsPerMinute;
}
