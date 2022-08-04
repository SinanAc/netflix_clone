// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/new_hot/i_new_hot_repo.dart';
import 'package:netflix_clone/domain/new_hot/model/new_hot_response.dart';

part 'new_hot_event.dart';
part 'new_hot_state.dart';
part 'new_hot_bloc.freezed.dart';

@injectable
class NewHotBloc extends Bloc<NewHotEvent, NewHotState> {
  final NewHotService _newHotService;
  NewHotBloc(this._newHotService) : super(NewHotState.initial()) {
/* 
Get New & Hot movie data 
*/
    on<LoadDataInComingSoon>((event, emit) async {
      // -- Send loading to UI
      emit(const NewHotState(
          comingSoonList: [],
          everyonesList: [],
          isLoading: true,
          isError: false));

      // -- Get data from remote
      final resluts = await _newHotService.getNewHotMovieData();

      // -- data to state
      final newState = resluts.fold(
        (MainFailures failure) {
          return const NewHotState(
              comingSoonList: [],
              everyonesList: [],
              isLoading: false,
              isError: true);
        },
        (NewHotResponse resp) {
          return NewHotState(
              comingSoonList: resp.results.reversed.toList(),
              everyonesList: state.everyonesList,
              isLoading: false,
              isError: false);
        },
      );
      emit(newState);
    });

/* 
Get New & Hot Tv data 
*/
    on<LoadDataInEveryones>((event, emit) async {
      // -- Send loading to UI
      emit(const NewHotState(
          comingSoonList: [],
          everyonesList: [],
          isLoading: true,
          isError: false));

      // -- Get data from remote
      final resluts = await _newHotService.getNewHotTvData();

      // -- data to state
      final newState = resluts.fold(
        (MainFailures failure) {
          return const NewHotState(
              comingSoonList: [],
              everyonesList: [],
              isLoading: false,
              isError: true);
        },
        (NewHotResponse resp) {
          return NewHotState(
              comingSoonList: state.comingSoonList,
              everyonesList: resp.results.reversed.toList(),
              isLoading: false,
              isError: false);
        },
      );
      emit(newState);
    });
  }
}
