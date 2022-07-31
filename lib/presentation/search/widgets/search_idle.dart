import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';
import 'package:netflix_clone/presentation/search/widgets/top_search_tile.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text('Error !!'));
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is empty !!'));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        imageUrl: '$imageAppendUrl${movie.posterPath}',
                        title: movie.originalTitle ?? '-No Title-');
                  },
                  separatorBuilder: (ctx, index) => const SizedBox(height: 15),
                  itemCount: state.idleList.length);
            },
          ),
        ),
      ],
    );
  }
}
