// ignore_for_file: prefer_final_fields, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/new_hot/i_new_hot_repo.dart';

import '../../domain/new_hot/model/new_hot_response.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  NewHotService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
/*
on event get home screen data
*/
    on<GetHomeScreenData>((event, emit) async {
      // -- send loading to UI
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      // -- get data
      final movieResult = await _homeService.getNewHotMovieData();
      final tvResult = await _homeService.getNewHotTvData();

      // -- movie data to state
      final stateOne = movieResult.fold((MainFailures failure) {
        return HomeState(
          stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          topTenTvList: [],
          tenseDramaList: [],
          southIndianList: [],
          isLoading: false,
          isError: true,
        );
      }, (NewHotResponse resp) {
        final pastYearList = resp.results;
        final trendingList = resp.results;
        final tenseList = resp.results;
        final southList = resp.results;
        pastYearList.shuffle();
        trendingList.shuffle();
        tenseList.shuffle();
        southList.shuffle();

        return HomeState(
          stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          pastYearMovieList: pastYearList,
          trendingMovieList: trendingList,
          topTenTvList: state.topTenTvList,
          tenseDramaList: tenseList,
          southIndianList: southList,
          isLoading: false,
          isError: false,
        );
      });

      // -- send to UI
      emit(stateOne);

      // -- tv data to state
      final stateTwo = tvResult.fold((MainFailures failure) {
        return HomeState(
          stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          topTenTvList: [],
          tenseDramaList: [],
          southIndianList: [],
          isLoading: false,
          isError: true,
        );
      }, (NewHotResponse resp) {
        return HomeState(
          stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          topTenTvList: resp.results,
          tenseDramaList: state.tenseDramaList,
          southIndianList: state.southIndianList,
          isLoading: false,
          isError: false,
        );
      });

      // -- send to UI
      emit(stateTwo);
    });
  }
}
