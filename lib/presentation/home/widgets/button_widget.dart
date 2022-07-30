import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String buttonText;
  final double iconSize;
  final double fontSize;
  final bool isNewHot;
  const ButtonWidget(
      {Key? key,
      required this.icon,
      required this.buttonText,
      this.iconSize = 30,
      this.fontSize = 14,
      this.isNewHot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: iconSize, color: kWhiteColor),
        Text(
          buttonText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: isNewHot ? kGreyColor : kWhiteColor),
        )
      ],
    );
  }
}
