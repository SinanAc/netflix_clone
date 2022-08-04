import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/new_hot/new_hot_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/coming_soon.dart';
import 'package:intl/intl.dart';

class BuildComingSoonList extends StatelessWidget {
  const BuildComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewHotBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewHotBloc>(context).add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<NewHotBloc, NewHotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while loading !!'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('List is empty'),
            );
          } else {
            return ListView.separated(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                final date = DateTime.parse(movie.releaseDate.toString());
                final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate.toString().split('-')[2],
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? '-No Title-',
                  movieDescription:
                      movie.overview ?? '-Sorry No Description Available-',
                );
              },
              separatorBuilder: (context, index) => kHeight15,
            );
          }
        },
      ),
    );
  }
}
