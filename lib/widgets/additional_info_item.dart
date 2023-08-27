import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.wind_power,
          color: kWhite,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "10 m/s",
          style: TextStyle(
              color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Wind",
          style: TextStyle(color: kGrey),
        )
      ],
    );
  }
}
