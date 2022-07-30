import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/button_widget.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: Column(children: const [
            Text(
              'FEB',
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, color: kGreyColor),
            ),
            Text('11',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 7)),
          ]),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VideoWidget(),
            kHeight15,
            Row(
              children: const [
                Text(
                  'Movie Name',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ButtonWidget(
                  icon: Icons.notifications_outlined,
                  iconSize: 20,
                  buttonText: 'Reminder',
                  fontSize: 10,
                ),
                kWidth,
                ButtonWidget(
                  icon: Icons.info_outline,
                  iconSize: 20,
                  buttonText: 'Info',
                  fontSize: 10,
                ),
                kWidth
              ],
            ),
            const Text('Coming on Friday', style: TextStyle(color: kGreyColor)),
            kHeight15,
            const Text('Movie Name',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            kHeight10,
            const Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspain. But when Jodi is forced to take a risk, she must decide whether to trust the new teacher or to abandon her old one.',
                style: TextStyle(color: kGreyColor)),
          ],
        ))
      ],
    );
  }
}
