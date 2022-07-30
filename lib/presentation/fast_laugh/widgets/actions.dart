import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class ActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isShare;
  final bool isNewHot;
  const ActionsWidget({Key? key,required this.icon,required this.title,this.isShare=false,this.isNewHot=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isShare?
        Transform.rotate(
      angle: -40 * pi / 180,
      child: 
         Icon(icon,
        color: kWhiteColor,
        size:isNewHot? 25 : 30,
        ),
        ):
        Icon(icon,
        color: kWhiteColor,
        size: 35,
        ),
        Text(title,
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: isNewHot? kGreyColor : kWhiteColor
          ),),
        
      ],
    );
  }
}