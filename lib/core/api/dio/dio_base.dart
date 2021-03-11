import 'package:dio/dio.dart';

mixin BaseRequest {
  final Dio _dio = Dio();

  Future<Options> _getOptions() async {
    bool authenticated = await _isLoggedIn();
    if (authenticated) {
      return Options(
          receiveTimeout: 5000,
          contentType: 'application/json',
          validateStatus: (status) {
            return status < 500;
          },
          headers: {'Authorization': 'Bearer ${await _getUserToken()}'});
    } else {
      return Options(
        receiveTimeout: 5000,
        contentType: 'application/json',
        validateStatus: (status) {
          return status < 500;
        },
      );
    }
  }

  Future<Response> getData(String url,
      {Map<String, String> params, bool withAuth = true}) async {
    return await _dio.get(url,
        queryParameters: params, options: await _getOptions());
  }

  Future<Response> postData(
    String url, {
    dynamic data,
  }) async {
    return await _dio.post(url, data: data, options: await _getOptions());
  }

  Future<Response> putData(
    String url, {
    dynamic data,
  }) async {
    return await _dio.put(url, data: data, options: await _getOptions());
  }

  Future<Response> deleteData(
    String url, {
    Map<String, dynamic> data,
  }) async {
    return await _dio.delete(url, data: data, options: await _getOptions());
  }

  Future<Response> downloadData(String url,
      {String savePath,
      Map<String, dynamic> data,
      Map<String, dynamic> queryParams,
      Function progress(int count, int total)}) async {
    return await _dio.download(url, savePath,
        options: await _getOptions(),
        data: data,
        onReceiveProgress: progress,
        queryParameters: queryParams);
  }

  Future<String> _getUserToken() async {
    return ""; //TODO: return user's auth token to request header
  }

  Future<bool> _isLoggedIn() async {
    return true; //TODO: check if user is logged in
  }
}
