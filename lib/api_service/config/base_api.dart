import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';


import 'env/env.dart';

class BaseApi {
  static BaseOptions _options() {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$apiusername:$apipassword'))}';
    return BaseOptions(
      baseUrl: "$baseUrl/",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Authorization': basicAuth,
      },
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
  }

  Dio dioClient() {
    final dio = Dio(_options());
    if (kDebugMode) {
      // print the api call log data
      dio.interceptors.add(HttpFormatter());
    }
    return dio;
  }
}
