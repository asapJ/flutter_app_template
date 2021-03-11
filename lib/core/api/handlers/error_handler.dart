import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/constants/error_strings.dart';
import 'package:flutter_app_template/utils/logger.dart';

class ErrorHandler {
  static String handleDioError(DioError error) {
    String errorDescription = "";

    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = kCanceledRequestErrorText;
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = kPoorInternetErrorText;
        break;
      case DioErrorType.DEFAULT:
        errorDescription = kNoInternetErrorText;
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = kPoorInternetErrorText;
        break;
      case DioErrorType.RESPONSE:
        Log().debug(
            "DIO ERROR: ${error.response.statusCode}", error.response.data);
        if (error.response.statusCode == 404)
          errorDescription = error.response.statusMessage ?? "Not Found";
        else if (error.response.statusCode == 400) {
          errorDescription = error.response.statusMessage ?? "Bad request";
        } else if (error.response.statusCode == 401) {
          errorDescription = error.response.statusMessage ??
              "These credentials are wrong \nCheck and try again";
        } else if (error.response.statusCode == 500) {
          errorDescription = error.response.statusMessage ??
              "Server is currently under maintenance, Try again later";
        } else {
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = kPoorInternetErrorText;
        break;
    }
    return errorDescription;
  }
}
