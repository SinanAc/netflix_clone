import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/new_hot/new_hot_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/presentation/new_hot/widgets/everyones.dart';

class BuildEveryonesList extends StatelessWidget {
  const BuildEveryonesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewHotBloc>(context).add(const LoadDataInEveryones());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewHotBloc>(context).add(const LoadDataInEveryones());
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
          } else if (state.everyonesList.isEmpty) {
            return const Center(
              child: Text('List is empty'),
            );
          } else {
            return ListView.separated(
              itemCount: state.everyonesList.length,
              itemBuilder: (context, index) {
                final tvShow = state.everyonesList[index];
                return EveryonesWidget(
                  posterPath: '$imageAppendUrl${tvShow.posterPath}',
                  movieName: tvShow.originalName ?? '-No Title-',
                  movieDescription:
                      tvShow.overview ?? '-Sorry No Description Available-',
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
