import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class AdditionalInfoItem extends StatelessWidget {
  final String value;
  final IconData icon;
  final String label;
  final int angle;
  final double size;
  const AdditionalInfoItem(
      {super.key,
      required this.value,
      required this.icon,
      required this.label,
      this.angle = 0,
      this.size = 26});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style:const TextStyle(
              color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Transform.rotate(
          angle: angle.toDouble(),
          child: Icon(
            icon,
            color: kWhite,
            size: size,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style:const TextStyle(color: kWhite),
        )
      ],
    );
  }
}
