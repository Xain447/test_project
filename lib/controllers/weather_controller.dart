


import 'package:get/state_manager.dart';
import 'package:test_project/models/weather_model.dart';
import '../services/remote_services.dart';


class WeatherController extends GetxController {

  var isLoading = true.obs;
  var weatherDetails = Rxn<WeatherModel>();
  RemoteServices remoteServices = RemoteServices();


  void fetchCurrentCityWeather(String location) async {
    try {
      isLoading(true);
      var weatherDetail = await remoteServices.fetchCurrentCityWeather(location);
      if (weatherDetail != null) {
        isLoading(false);
        weatherDetails.value = weatherDetail;
      }
    } finally {
      isLoading(false);
    }
  }

}