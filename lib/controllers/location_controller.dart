



import 'package:geocoding/geocoding.dart' as gc;
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData userLocation;
  var userData = "".obs;

  @override
  void onInit() {
    getUserLocation();
    super.onInit();
  }

  Future<void> getUserLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    userLocation = _locationData;
    var lat = userLocation.latitude;
    var lang = userLocation.longitude;

    getAddressFromLatLong(lat!, lang);
  }

  // get address from the latitude and longitude here we only get city
  Future<void> getAddressFromLatLong(double lat, lang)async {
    List<gc.Placemark> placeMarks = await gc.placemarkFromCoordinates(lat, lang);
    gc.Placemark place = placeMarks[0];
    userData.value = '${place.locality}';
  }
}