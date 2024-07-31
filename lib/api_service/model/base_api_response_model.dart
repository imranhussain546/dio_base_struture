class BaseApiResponse {
  String? status;
  String? message;
  String? type;
  String? accessToken;
  dynamic data; // Allow data to be of any type

  BaseApiResponse({
    this.status,
    this.message,
    this.type,
    this.accessToken,
    required this.data,
  });

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) {
    return BaseApiResponse(
      status: json['err_code'],
      message: json['message'],
      type: json['type'],
      accessToken: json['access_token'],
      data: json['data'],
    );
  }
}