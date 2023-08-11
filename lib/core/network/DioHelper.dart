import 'package:dio/dio.dart';

import '../../login/login_cubit.dart';
import '../shared.dart';
class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://localhost:8000/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
     data,
  }) async {
    Response response;
    dio.options.headers = {
      'Authorization': "Bearer "+"$token",
      "Accept":"application/json"
    };
    try {
      response = await dio.get(url,queryParameters: query);
    } on DioError catch (e) {
      return e.response!;
    }
    return response;
  }
  static Future<Response>postData( {
   required String url,
   required data,
    String? token,
    Map<String, dynamic>? query,
  })async{
    Response response;
    dio.options.headers = {
      'auth-token': token,
    };
    try {
      response = await dio.post(
        url,
        data: data,
        queryParameters: query,
      );
    } on DioError catch (e) {
      return e.response!;
      //  return e.response!;
    }
    return response;
  }
}
