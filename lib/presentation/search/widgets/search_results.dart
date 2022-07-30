import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const gridImage =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y4BbshOj69MOIhsm0oELDnymiTY.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        const SearchTextTItle(title: 'Movies & TV'),
        kHeight10,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: List.generate(
            12,
            (index) {
              return const ResultCard();
            },
          ),
        ))
      ],
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: const DecorationImage(
            image: NetworkImage(
                'https://igimages.gumlet.io/tamil/home/kamal-vikrammovie-glimpseposter.jpg?w=376&dpr=2.6'),
            fit: BoxFit.cover,
          )),
    );
  }
}
