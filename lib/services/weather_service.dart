import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/utils/api_key.dart';

class WeatherService {
  static Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // String cityName = 'Ernakulam,IN';
      Location location = Location();
      await location.getCurrentLocation();

      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitide}&appid=$openWeatherApiKey'));

      if (response.statusCode != 200) {
        print("Something went wrong");
        throw Exception("Something went wrong please try again");
      }

      final result = jsonDecode(response.body);

      return result;
    } catch (e) {
      throw Exception("Something went wrong ${e.toString()}");
    }
  }
}

