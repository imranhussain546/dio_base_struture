import 'package:dio/dio.dart';
import 'package:dio_base_struture/api_service/api_constant/api_response_error_massage.dart';
import 'package:dio_base_struture/api_service/api_constant/api_url.dart';
import 'package:dio_base_struture/api_service/config/base_api.dart';
import 'package:dio_base_struture/api_service/helper/exception_handler.dart';
import 'package:dio_base_struture/api_service/helper/isolate_api_call_internet_checker.dart';
import 'package:dio_base_struture/api_service/model/base_api_response_model.dart';
import 'package:dio_base_struture/model/boarding_model.dart';


class AuthRepository extends BaseApi {

  // onBoarding
  Future<OnBoardingModel> getOnBoarding() async {
    try {
      final Map<String, dynamic> request = {

      };
      return await makeIsolateApiCallWithInternetCheck(
          _onBoardingIsolate, request);
    } catch (e) {
      ApiExceptionHandler.handleUnexpectedError(e);
      rethrow;
    }
  }

  Future<OnBoardingModel> _onBoardingIsolate(
      Map<String, dynamic> request) async {
    try {
      final dio = dioClient();
      final response = await dio.get(ApiUrl.endpointOnBoarding);

      // Check the response and parse the data
      final baseApiResponse = BaseApiResponse.fromJson(response.data);
      if (baseApiResponse.status == ApiResponseErrorMessage.valid) {
        return OnBoardingModel.fromJson(baseApiResponse.data);
      } else {
        // Throw an exception if the API response status is invalid
        throw(baseApiResponse.message!);
      }
    } catch (e) {
      if (e is DioException) {
        ApiExceptionHandler.handleDioException(e);
      } else {
        ApiExceptionHandler.handleUnexpectedError(e);
      }
      rethrow;
    }
  }

/*// login
  Future<UserDetailsModel> login({required String mobileNo}) async {
    try {
      var apiRequest=ApiRequest.login(mobile: mobileNo);
      return await makeIsolateApiCallWithInternetCheck(
          _loginIsolate, apiRequest);
    } catch (e) {
      ApiExceptionHandler.handleUnexpectedError(e);
      rethrow;
    }
  }

  Future<UserDetailsModel> _loginIsolate(
      Map<String, dynamic> request) async {
    try {
      FormData data = FormData.fromMap(request);
      final dio = dioClient();
      final response = await dio.post(ApiUrl.endpointOnLogin,data:data);

      // Check the response and parse the data
      final baseApiResponse = BaseApiResponse.fromJson(response.data);
      if (baseApiResponse.status == ApiResponseErrorMessage.valid) {
        if(baseApiResponse.type==ApiResponseErrorMessage.detailNotFound){
          return UserDetailsModel();
        }else{
          return UserDetailsModel.fromJson(baseApiResponse.data);
        }

      } else {
        // Throw an exception if the API response status is invalid
        throw (baseApiResponse.message!);
      }
    } catch (e) {
      if (e is DioException) {
        ApiExceptionHandler.handleDioException(e);
      } else {
        ApiExceptionHandler.handleUnexpectedError(e);
      }
      rethrow;
    }
  }*/
}