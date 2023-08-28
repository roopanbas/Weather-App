import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/additional_info_item.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/hourly_forecast_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getWeather();
    super.initState();
  }

  void getWeather() async {
    WeatherService.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Ernakulam"),
                subtitle: Text("12 September 2023"),
                titleTextStyle: const TextStyle(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 26),
                subtitleTextStyle: const TextStyle(color: kGrey),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  color: kGrey,
                ),
              ),
            ),
            CurrentWeatherCard(),
            Container(
              decoration: boxDecoration,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(),
                  AdditionalInfoItem(),
                  AdditionalInfoItem()
                ],
              ),
            ),
            Text("Weekly Forecast"),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => HourlyForecastItem()),
            )
          ],
        ),
      ),
    );
  }
}
