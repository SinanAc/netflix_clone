import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

class MovieCard extends StatelessWidget {
  final int index;
  const MovieCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 40),
            Container(
              margin: const EdgeInsets.only(right: 5),
              height: MediaQuery.of(context).devicePixelRatio * 70,
              width: MediaQuery.of(context).devicePixelRatio * 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                    image: NetworkImage(gridImage),
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: -10,
            child: BorderedText(
                strokeColor: kWhiteColor,
                strokeWidth: 5,
                child: Text('${index + 1}',
                    style: const TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ))))
      ],
    );
  }
}
