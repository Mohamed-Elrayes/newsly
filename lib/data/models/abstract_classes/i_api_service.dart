

abstract class IApiService {
Future<dynamic> getDataService(String url,
      {Map<String, dynamic>? queryParameters});

  Future<dynamic> postDataService(String url,
      {data, Map<String, dynamic>? queryParameters});
}
