import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/url.dart';
import 'package:netflix_clone/presentation/home/widgets/bg_home.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_card_with_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: ((context, index, _) =>
              NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state.isError) {
                          return const Center(
                              child: Text('Error while gettig data !!'));
                        } else {
                          final pastYrList =
                              state.pastYearMovieList.map((movie) {
                            return '$imageAppendUrl${movie.posterPath}';
                          }).toList();
                          final topTen = state.topTenTvList.map((movie) {
                            return '$imageAppendUrl${movie.posterPath}';
                          }).toList();
                          return ListView(children: [
                            BackgroundHome(imageUrl: topTen[0]),
                            kHeight10,
                            MainCardsWithTitle(
                              title: 'Released in the past year',
                              imageList: pastYrList,
                            ),
                            kHeight15,
                            MainCardsWithTitle(
                              title: 'Trending Now',
                              imageList: pastYrList.reversed.toList(),
                            ),
                            kHeight15,
                            NumberCard(
                              title: 'Top 10 in India Today',
                              imgList: topTen,
                            ),
                            kHeight15,
                            MainCardsWithTitle(
                                title: 'Tense Dramas',
                                imageList: topTen.reversed.toList()),
                            kHeight15,
                            MainCardsWithTitle(
                                title: 'South Indian Cinema',
                                imageList: pastYrList.reversed.toList()),
                          ]);
                        }
                      },
                    ),
                    scrollNotifier.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            height: 90,
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(netflixLogo,
                                        width: 60, height: 60),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('TV Shows', style: kHomeStyle),
                                    Text('Movies', style: kHomeStyle),
                                    Text('Categories', style: kHomeStyle)
                                  ],
                                )
                              ],
                            ),
                          )
                        : kHeight10
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
