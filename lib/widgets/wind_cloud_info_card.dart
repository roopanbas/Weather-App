import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/additional_info_item.dart';

class WindCloudInfoCard extends StatelessWidget {
  final double wind;
  final int angle;
  final clouds;
  final sunrise;
  final sunset;
  const WindCloudInfoCard({super.key,required this.wind,required this.angle,required this.clouds,required this.sunrise,required this.sunset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: boxDecoration,
          width: 120,
          height: 150,
          child: AdditionalInfoItem(
              value: wind.toString(),
              icon: Icons.arrow_upward,
              angle: angle,
              size: 56,
              label: "Wind"),
        ),
        Expanded(
          child: Container(
            height: 150,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: boxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Clouds          $clouds%",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                Text(
                  "SunRise       ${DateFormat.jm().format(sunrise)}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                Text(
                  "SunSet          ${DateFormat.jm().format(sunset)}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
