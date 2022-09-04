import 'package:flutter/material.dart';
import 'package:shifts_offers/resources/colors.dart';
import 'package:shifts_offers/resources/styles.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconText({Key? key, required this.text, required this.icon,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.only(right: 4, bottom: 4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
              Border.all(color:   cTextColor  )),
          child:

          Center(
            child: Icon(icon,

            size: 25,
            ),
          ),
        ),
        Text(text, style: sDetailsItem,)
      ],
    );
  }
}
