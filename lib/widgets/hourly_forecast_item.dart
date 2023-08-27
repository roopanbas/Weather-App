import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: 100,
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("10 am"),
          // SizedBox(
          //       height: 10,
          //     ),
          Icon(Icons.cloud),
          // SizedBox(
          //       height: 10,
          //     ),
          Text("26 C")
        ],
      ),
    );
  }
}
