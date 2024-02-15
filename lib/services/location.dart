import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  String? cityName;

  Future<void> getCurrentLocation() async {
    bool serviceEnable = false;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnable) {
      return Future.error('Location Services are disable');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permission has denied, Enable on Setting');
      }
    }

    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      this.latitude = position.latitude;
      this.longitude = position.longitude;

      
    } catch (e) {
      print(e);
    }
  }
}
