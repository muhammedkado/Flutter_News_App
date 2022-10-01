import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

static  Future<Response> getData({
   required Map<String,dynamic> query,
   required String url,
  }) async {
    return await dio!.get(url,queryParameters:query );

  }
}
