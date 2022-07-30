import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';
import 'package:netflix_clone/presentation/search/widgets/top_search_tile.dart';

const imgUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/iczRRWCXjNsDmiHoVejomBqiwuG.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        const SearchTextTItle(title: 'Top Searches'),
        kHeight10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => const SizedBox(height: 15),
              itemCount: 10),
        ),
      ],
    );
  }
}
