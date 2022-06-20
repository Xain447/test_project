

import 'package:flutter/foundation.dart';

class APIBase{
  static String get baseURL {
    if (kReleaseMode) {
      return "https://api.weatherapi.com/v1";
    } else {
      return "https://api.weatherapi.com/v1";
    }
  }

}
