import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<bool> _isLocationAccessable() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      print("Service disabled");
      return false;
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("Permission denied");
        return false;
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      print("Permission denied forever");
      return false;
    }

    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    bool isLocationAccessable = await _isLocationAccessable();

    if (!isLocationAccessable) return null;

    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    // if (position.isMocked) {
    //   print("Fake gps");
    //   return null;
    // }

    return position;
  }

  static Future<double?> getDistanceTo(double latitude, double logitude) async {
    Position? position = await getCurrentPosition();
    if (position == null) {
      print("Undefined current position");
      return null;
    }

    return Geolocator.distanceBetween(
        latitude, logitude, position.latitude, position.longitude);
  }

  static Future<String?> getCurrentAddress() async {
    Position? position = await getCurrentPosition();
    if (position == null) {
      print("Undefined current position");
      return null;
    }

    var addresses = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: "id_ID");

    var currentAddress = addresses[0];
    // print(currentAddress);

    return '${currentAddress.street}, ${currentAddress.subLocality}, ${currentAddress.locality}, ${currentAddress.postalCode}, ${currentAddress.country}';
  }
}
