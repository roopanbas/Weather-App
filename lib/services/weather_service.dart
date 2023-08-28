import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/utils/api_key.dart';

class WeatherService {
  static Future<Map<String, dynamic>> getCurrentWeather() async {
    print("stated");
    try {
      //String cityName = 'Ernakulam,IN';
      Location location = Location();
      await location.getCurrentLocation();

      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitide}&appid=$openWeatherApiKey'));

      if (response.statusCode != 200) {
        throw 'Something went wrong please try again';
        //  print("response:${response.body}");
        //print(result.runtimeType);

        // var currentWeather =
        //     WeatherModel.fromJson(result as Map<String, dynamic>);
        // weather = currentWeather;
        // print(currentWeather.clouds);
      }
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } catch (e) {
      throw Exception("Something went wrong ${e.toString()}");
    }
  }
}
