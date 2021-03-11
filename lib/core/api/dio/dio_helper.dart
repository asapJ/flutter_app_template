import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/core/api/handlers/error_handler.dart';
import 'package:flutter_app_template/core/constants/error_strings.dart';
import 'package:flutter_app_template/utils/logger.dart';
import 'dio_base.dart';

class RequestHelper with BaseRequest {
  Future<dynamic> fetch(
      {@required String url, Map<String, dynamic> params}) async {
    var responseJson;
    try {
      final response = await getData(url, params: params);
      responseJson = response.data;
      Log().debug("GET REQUEST RESPONSE", responseJson);
    } on SocketException {
      return kNoInternetErrorText;
    } on DioError catch (e) {
      return ErrorHandler.handleDioError(e);
    } catch (e) {
      return e.toString();
    }
    return responseJson;
  }

  Future<dynamic> post(
      {@required String url, Map<String, dynamic> data}) async {
    var responseJson;
    try {
      final response = await postData(url, data: data);
      responseJson = response.data;
      Log().debug("POST REQUEST RESPONSE", responseJson);
    } on SocketException {
      return kNoInternetErrorText;
    } on DioError catch (e) {
      return ErrorHandler.handleDioError(e);
    } catch (e) {
      return e.toString();
    }
    return responseJson;
  }

  Future<dynamic> put({@required String url, Map<String, dynamic> data}) async {
    var responseJson;
    try {
      final response = await putData(url, data: data);
      responseJson = response.data;
      Log().debug("PUT REQUEST RESPONSE", responseJson);
    } on SocketException {
      return kNoInternetErrorText;
    } on DioError catch (e) {
      return ErrorHandler.handleDioError(e);
    } catch (e) {
      return e.toString();
    }
    return responseJson;
  }

  Future<dynamic> delete(
      {@required String url, Map<String, dynamic> data}) async {
    var responseJson;
    try {
      final response = await deleteData(url, data: data);
      responseJson = response.data;
      Log().debug("DELETE REQUEST RESPONSE", responseJson);
    } on SocketException {
      return kNoInternetErrorText;
    } on DioError catch (e) {
      return ErrorHandler.handleDioError(e);
    } catch (e) {
      return e.toString();
    }
    return responseJson;
  }

  Future<dynamic> downloadFile(
      {@required String url,
      String savePath,
      Map<String, dynamic> data,
      Map<String, dynamic> queryParams,
      Function progress(int count, int total)}) async {
    var responseJson;
    try {
      final response = await downloadData(url,
          savePath: savePath,
          data: data,
          progress: progress,
          queryParams: queryParams);
      responseJson = response.data;
      Log().debug("DOWNLOAD REQUEST RESPONSE", responseJson);
    } on SocketException {
      return kNoInternetErrorText;
    } on DioError catch (e) {
      return ErrorHandler.handleDioError(e);
    } catch (e) {
      return e.toString();
    }
    return responseJson;
  }
}
