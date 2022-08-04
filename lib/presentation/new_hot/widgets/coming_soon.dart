import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/button_widget.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String movieDescription;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(children: [
            Text(
              month,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, color: kGreyColor),
            ),
            Text(day,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4)),
          ]),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoWidget(imageUrlPath: posterPath),
            kHeight15,
            Row(
              children: [
                Expanded(
                  child: Text(
                    movieName,
                    style: TextStyle(
                      fontFamily: GoogleFonts.acme().fontFamily,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kWidth,
                const ButtonWidget(
                  icon: Icons.notifications_outlined,
                  iconSize: 22,
                  buttonText: 'Reminder',
                  fontSize: 12,
                  isNewHot: true,
                ),
                kWidth,
                const ButtonWidget(
                  icon: Icons.info_outline,
                  iconSize: 22,
                  buttonText: 'Info',
                  fontSize: 12,
                  isNewHot: true,
                ),
                kWidth
              ],
            ),
            Text('Coming on $month $day 2023',
                style: const TextStyle(color: kGreyColor)),
            kHeight10,
            Text(movieName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 5),
            Text(movieDescription,
                style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 16,
                )),
          ],
        ))
      ],
    );
  }
}
