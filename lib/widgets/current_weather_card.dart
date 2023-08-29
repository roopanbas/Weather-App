import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:lottie/lottie.dart';

class CurrentWeatherCard extends StatelessWidget {
  final double currentTemp;
  final String currentSky;
  final double feelsLike;
  final String image;
  const CurrentWeatherCard(
      {super.key,
      required this.currentTemp,
      required this.currentSky,
      required this.feelsLike,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: boxDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: Lottie.network(
                  image,
                  animate: true,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "${currentTemp.toInt().toString()}°C",
                style: const TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentSky,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              Text(
                "Feels like ${feelsLike.toInt().toString()}°C",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
