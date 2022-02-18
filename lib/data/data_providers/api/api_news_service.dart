
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../core/constants/constants.dart';

import '../../models/error_api_model.dart';
import 'dio_web_server.dart';

import '../../models/abstract_classes/i_api_service.dart';

class WebServiceNewsApi extends IApiService {
  DioWebServer dioWebServer;
  WebServiceNewsApi() : dioWebServer = DioWebServer(baseUrlName: baseurlApi);

  @override
  Future<dynamic> getDataService(String url,
      {Map<String, dynamic>? queryParameters}) async {
    late final Response response;
    try {
      logger.log(Level.info, '######## call Api #######');
      response =
          await dioWebServer.dio.get(url, queryParameters: queryParameters);
      // logger.i( response.data);
      return response.data;
    } 
    // on Exception  catch (e) {
    //   logger.i("ExceptionMessage");

    //   throw ExceptionMessage.fromCode(e);
    //   // return e.toString();
    // }
     on DioError catch (e) {
      logger.i(e.response?.data);

      final dioError =  ErrorApiModel.fromJson(e.response?.data);
      throw dioError;
    }
  }

  @override
  Future<dynamic> postDataService(String url,
      {data, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }
}
