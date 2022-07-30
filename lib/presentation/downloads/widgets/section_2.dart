import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/downloads/widgets/dwld_img.dart';

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/13r1DFhfL0qufFjXnrvWuh6qKqH.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ryKwNlAfDXu0do6SX9h4G9Si1kG.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y4BbshOj69MOIhsm0oELDnymiTY.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(children: [
      const Text(
        'Introducing Downloads for you',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      kHeight10,
      const Text(
        'We will download a personalized selection of movies and shows for you, so there is always something to watch on your device',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: kGreyColor,
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height * 0.48,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.38,
              backgroundColor: kGreyColor[800],
            ),
            DownloadsImageWidget(
              img: imageList[2],
              margin: const EdgeInsets.only(right: 160),
              angle: -20,
              size: Size(size.width * 0.4, size.height * 0.28),
            ),
            DownloadsImageWidget(
              img: imageList[1],
              margin: const EdgeInsets.only(left: 160),
              angle: 20,
              size: Size(size.width * 0.4, size.height * 0.28),
            ),
            DownloadsImageWidget(
              img: imageList[0],
              margin: const EdgeInsets.only(top: 15),
              size: Size(size.width * 0.42, size.height * 0.32),
            )
          ],
        ),
      ),
    ]);
  }
}