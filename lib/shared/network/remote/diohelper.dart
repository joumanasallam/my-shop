import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping/shared/network/remote/cache_helper.dart';

import '../constant.dart';



class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(

        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization':'Bearer ${CacheHelper.getData(key: "token")}',
      'Content-Type': 'application/json'
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    debugPrint(data.toString());
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}',
      'Content-Type': 'application/json'
    };
    return dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data),
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            print("status code here${status}");
            return status! < 500;
          }),
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    debugPrint(data.toString());
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      'Content-Type': 'application/json'
    };
    return dio.delete(
      url,
      queryParameters: query,
      data: FormData.fromMap(data!),
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            print("status code here${status}");
            return status! < 500;
          }),
    );
  }


}