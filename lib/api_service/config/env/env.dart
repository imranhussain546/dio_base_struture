import 'package:flutter/foundation.dart';

// API server URL
const String productionServerHostName = 'https://demo.colormoon.in/weebus';
const String devServerHostName = 'https://demo.colormoon.in/weebus';

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


