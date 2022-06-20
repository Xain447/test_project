

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controllers/counter_controller.dart';
import 'package:test_project/controllers/location_controller.dart';
import 'package:test_project/controllers/weather_controller.dart';
import 'package:test_project/utils/color_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  double height = Get.height;
  double width = Get.width;
  int? number;
  final CounterController counterController = Get.put(CounterController());
  final WeatherController weatherController = Get.put(WeatherController());
  final LocationController locationController = Get.put(LocationController());



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSpaceVertical(height * 0.1),
          Center(
            child: Column(
              children: [
                Obx((){
                  return weatherController.weatherDetails.value != null ? Column(
                    children: [
                      Text("City: "+weatherController.weatherDetails.value!.location!.name!),
                      Text("Region: "+weatherController.weatherDetails.value!.location!.region!),
                      Text("Country: "+weatherController.weatherDetails.value!.location!.country!),
                      Text("Weather: "+weatherController.weatherDetails.value!.current!.condition!.text!),
                      Text("Wind MPH: "+weatherController.weatherDetails.value!.current!.windMph!.toString()),
                      Text("Humidity: "+weatherController.weatherDetails.value!.current!.humidity!.toString()),
                    ],
                  )
                  : const Text("Press the weather icon to get your location and weather");
                }),
                buildSpaceVertical(height * 0.02),
                const Text("You have pushed the icon this many times"),
                buildSpaceVertical(height * 0.01),
                Obx((){
                  return Text(counterController.count.value.toString());
                }),
              ],
            ),
          ),
          buildSpaceVertical(height * 0.4),
          SizedBox(
            height: height * 0.15,
            width: width,
            child: Stack(
              children: [
                Obx(() {
                  return counterController.count.value == 10 ? const SizedBox.shrink() :
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        counterController.increment();
                      },
                      child: buttonWidget(Icons.add),
                    ),
                  );
                }),
                Obx(() {
                  return counterController.count.value == 0 ? const SizedBox.shrink() :
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () {
                        counterController.decrement();
                      },
                      child: buttonWidget(Icons.minimize),
                    ),
                  );
                }),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Obx((){
                    return locationController.userData.value != '' ?
                    InkWell(
                      onTap: () {
                        weatherController.fetchCurrentCityWeather(locationController.userData.value);
                      },
                      child: buttonWidget(Icons.cloud),
                    )
                    : buttonWidget(Icons.cloud);
                  })
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: InkWell(
                      onTap: () {
                        if (Get.isDarkMode) {
                          Get.changeThemeMode(ThemeMode.light);
                        } else {
                          Get.changeThemeMode(ThemeMode.dark);
                        }
                      },
                      child: buttonWidget(Icons.color_lens_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buttonWidget(IconData icon) {
    return Container(
      height: height * 0.05,
      width: width * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorManager.blueColor,
      ),
      child: Center(child: Icon(icon, color: ColorManager.whiteColor, size: 30)),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      title: const Text("Weather Counter"),
    );
  }

  SizedBox buildSpaceVertical(height) => SizedBox(height: height);



}
