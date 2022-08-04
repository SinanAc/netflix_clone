import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/movie_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberCard extends StatelessWidget {
  final String title;
  final List<String> imgList;
  const NumberCard({
    Key? key,
    required this.imgList,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight10,
        LimitedBox(
          maxHeight: MediaQuery.of(context).devicePixelRatio * 70,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => MovieCard(
                        index: index,
                        imgUrl: imgList[index],
                      ))),
        ),
      ],
    );
  }
}
