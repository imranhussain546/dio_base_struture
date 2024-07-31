import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiExceptionHandler {
  static void handleDioException(DioException e) {
    // Log the error in Firebase Crashlytics
    // FirebaseCrashlytics.instance.recordError(e, StackTrace.current);

    switch (e.response?.statusCode) {
      case 500:
        throw 'Server error. Please try again later.';
      case 404:
        throw 'URL not found. Please contact admin.';
      case 401:
        throw 'Unauthorized request. Please log in again.';
      case 403:
        throw 'Forbidden access. Please check your permissions.';
      case 408:
        throw 'Request timeout. Please try again.';
      default:
        throw 'An unexpected error occurred. Please try again.';
    }
  }

  static void handleUnexpectedError(Object error) {
    if (kDebugMode) {
      print('Unexpected error: $error');
    }
    throw error;
  }
}
