import 'package:flutter/foundation.dart';

// API server URL
const String productionServerHostName = 'https://jsjs.com/sss';
const String devServerHostName = 'https://jsjs.com/sss';

//host name
const String hostName =
    kDebugMode ? devServerHostName : productionServerHostName;

//base url
const String baseUrl = '$hostName/api/';

//DeepLink URL
// const String deepLinkURL = "https://.com";

// API username and password
const String apiusername = 'admin';
const String apipassword = '1234';


