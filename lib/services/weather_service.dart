import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/api_key.dart';

class WeatherService {
  static Future<WeatherModel> getCurrentWeather() async {
    print("stated");
    late WeatherModel weather;
    try {
      String cityName = 'Ernakulam,IN';

      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey'));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
      //  print("response:${response.body}");

        WeatherModel currentWeather = WeatherModel.fromJson(result);
        weather = currentWeather;
      }
      return weather;
    } catch (e) {
      throw Exception("Something went wrong ${e.toString()}");
    }
  }
}
