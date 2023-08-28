import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 10.1373217237236;
  double longitide = 76.26944615855534;

  Future<void> getCurrentLocation() async {
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
      print(longitide);
      print(latitude);
    } catch (e) {
      print(e.toString());
    }
  }
}
