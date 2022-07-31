import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<int>> likedVideoIDsNotifier = ValueNotifier<Set<int>>({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    final IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>(
      (event, emit) async {
        // Sending loading to UI
        emit(
          const FastLaughState(
            videoList: [],
            likedVideoIDs: [],
            isLoading: true,
            isError: false,
          ),
        );
        // get trending movies
        final results = await downloadService.getDownloadsImages();
        final states = results.fold(
          (l) {
            return const FastLaughState(
              videoList: [],
              isLoading: false,
              isError: true,
            );
          },
          (resp) => FastLaughState(
            videoList: resp,
            isLoading: false,
            isError: false,
          ),
        );

        // Send to UI
        emit(states);
      },
    );

    on<LikeVideo>((event, emit) async {
      likedVideoIDsNotifier.value.add(event.videoId);
      likedVideoIDsNotifier.notifyListeners();
    });

    on<UnLikeVideo>((event, emit) async {
      likedVideoIDsNotifier.value.remove(event.videoId);
      likedVideoIDsNotifier.notifyListeners();
    });
  }
}
