
import 'package:flutter/material.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/styles.dart';

class CircularText extends StatelessWidget {
  final String name;
  const CircularText({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius:
          BorderRadius.circular(25),
          color: cLightGreyColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 2.0, horizontal: 8),
        child: Text(
          name,
          style: sBodyTitleStyle.copyWith(
              color: cGreyColor),
        ),
      ),
    );
  }
}
