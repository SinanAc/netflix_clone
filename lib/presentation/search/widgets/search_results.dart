import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const gridImage = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y4BbshOj69MOIhsm0oELDnymiTY.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTextTItle(title: 'Movies & TV'),
        kHeight,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.4,
          children: List.generate(
            12,
            (index) {
              return const MainCard();
            },
          ),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: const DecorationImage(
          image:  NetworkImage(gridImage),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
