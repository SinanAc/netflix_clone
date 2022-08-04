import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class ActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isNewHot;
  const ActionsWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.isNewHot = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isNewHot ? kGreyColor : kWhiteColor),
        ),
      ],
    );
  }
}
