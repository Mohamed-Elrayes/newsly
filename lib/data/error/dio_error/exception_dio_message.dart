import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/strings.dart';

class ExceptionMessage  implements Exception  {
  final String message;
  const ExceptionMessage([this.message = 'An unknown exception occurred.']);
  factory ExceptionMessage.fromCode(error) {
    if(error is SocketException){
    return const ExceptionMessage('No Internet Connection');
    }
      if (error is DioError) {
      switch (error.type) {
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 400:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage('Error: please try again');
          case 401:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage(
                'Please Enter username and password');
          case 403:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage(
                'Access is forbidden to the requested page.');
          case 404:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage('Not find the page.');
          case 408:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage(
                'The request took longer than the server was prepared to wait.');
          case 409:
            logger.e('error from dio ${error.error}');
            return const ExceptionMessage('Occur Conflict');
          case 422:
            logger.e('error from dio error  ${error.error}');
            logger.e('error from dio error  ${error.response!.data}');
            return const ExceptionMessage('Server Exception');
          case 429:
            logger.e('error from dio error  ${error.error}');
            return const ExceptionMessage('Your monthly usage limit has been reached. Please upgrade your Subscription Plan');
          case 500:
            logger.e('error from dio error other ${error.error}');
            return const ExceptionMessage('internal server Error');
          case 503:
            logger.e('error from dio error other ${error.error}');
            return const ExceptionMessage(
                "we're not available right now , try again after while");
          default:
            logger.e('error from dio error other ${error.error}');
            return const ExceptionMessage('UnknownError');
        }
              case DioErrorType.cancel:
        logger.e('error from dio ${error.error}');
        return const ExceptionMessage('No Internet Connection');
      case DioErrorType.connectTimeout:
        logger.e('error from dio ${error.error}');
        return const ExceptionMessage('please try again');
      // case DioErrorType.DEFAULT:
      //   exception =
      //       _ApplicationException(_ExceptionType.noInternetConnection);
      //   break;
      case DioErrorType.receiveTimeout:
        logger.e('error from dio ${error.error}');
        return const ExceptionMessage('please try again');

      case DioErrorType.sendTimeout:
        logger.e('error from dio ${error.error}');
        return const ExceptionMessage('please try again');

      default:
        logger.e('error from dio error other ${error.error}');
        return const ExceptionMessage('UnknownError');
    }
  }
     return const ExceptionMessage('unknownError');
    }
    
}

