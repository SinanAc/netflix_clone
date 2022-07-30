import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/actions.dart';
import 'package:netflix_clone/presentation/home/widgets/button_widget.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/video_widget.dart';

class EveryonesWidget extends StatelessWidget {
  const EveryonesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text('Movie Name',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          )),
      kHeight10,
      const Text(
          'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspain.',
          style:  TextStyle(color: kGreyColor)),
      kHeight15,
      const VideoWidget() ,
      kHeight10,
      Row(
        children: const [
          SizedBox(
            height: 50,
            width: 50,
          ),
          Spacer(),
          ActionsWidget(icon: Icons.send_outlined, title: 'Share',isShare: true,isNewHot: true,),
          kWidth,
          ButtonWidget(icon: Icons.add, buttonText: 'My List',isNewHot: true,),
          kWidth,
          ButtonWidget(icon: Icons.play_arrow, buttonText: 'Play',isNewHot: true,),
          kWidth
        ],
      )   
    ]);
  }
}
