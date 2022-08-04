import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/button_widget.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/video_widget.dart';

class EveryonesWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String movieDescription;
  const EveryonesWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(movieName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 5),
        Text(movieDescription,
            style: const TextStyle(color: kGreyColor, fontSize: 16)),
        kHeight15,
        VideoWidget(
          imageUrlPath: posterPath,
        ),
        kHeight10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SizedBox(
              height: 50,
              width: 50,
            ),
            Spacer(),
            ButtonWidget(
              icon: CupertinoIcons.paperplane,
              buttonText: 'Share',
              iconSize: 25,
            ),
            kWidth15,
            ButtonWidget(
              icon: Icons.add,
              buttonText: 'My List',
            ),
            kWidth15,
            ButtonWidget(
              icon: Icons.play_arrow,
              buttonText: 'Play',
            ),
          ],
        )
      ]),
    );
  }
}
