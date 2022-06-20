
import 'package:http/http.dart' as http;
import 'package:test_project/models/weather_model.dart';
import '../network_module/api_base.dart';
import '../network_module/api_path.dart';

class RemoteServices {
  static var client = http.Client();

  Future<WeatherModel?> fetchCurrentCityWeather(String location) async {
    final queryParameters = {  'key': '68efbf3dfd824f5ba07103916221906', 'q': location };
    var response = await client.get(Uri.parse(APIBase.baseURL + APIPathHelper.getValue(APIPath.weather)).replace(queryParameters: queryParameters));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return weatherModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}