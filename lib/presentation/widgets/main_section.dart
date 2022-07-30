import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainCardsWithTitle extends StatelessWidget {
  final String title;
  const MainCardsWithTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        const SizedBox(height: 5),
        LimitedBox(
          maxHeight: MediaQuery.of(context).devicePixelRatio * 70,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => const MainCard())),
        ),
      ],
    );
  }
}
