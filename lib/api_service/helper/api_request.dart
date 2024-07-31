class ApiRequest{
  static Map<String, dynamic> login({
    required String mobile,
  }) {
    return {
      'mobile': mobile,
    };
  }

  static Map<String, dynamic> verifyOtp({
    required String mobile,
    required String otp,
  }) {
    return {
      'mobile': mobile,
      'otp': otp,
    };
  }

  static Map<String, dynamic> accessToken({
    required String accessToken,
  }) {
    return {
      'access_token': accessToken,
    };
  }

}