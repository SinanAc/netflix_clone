part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videoList,
    @Default([]) List<int> likedVideoIDs,
    required bool isLoading,
    required bool isError,
  }) = _FastLaughState;

  factory FastLaughState.initial() => const FastLaughState(
      videoList: [], likedVideoIDs: [], isLoading: true, isError: false);
}
