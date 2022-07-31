import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

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
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(
                12,
                (index) {
                  final movie = state.searchResultList[index];
                  return ResultCard(searchImageUrl: movie.posterImageUrl);
                },
              ),
            );
          },
        ))
      ],
    );
  }
}

class ResultCard extends StatelessWidget {
  final String searchImageUrl;
  const ResultCard({Key? key, required this.searchImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: NetworkImage(searchImageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
