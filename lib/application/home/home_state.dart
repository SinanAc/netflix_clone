part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required final String stateId,
    required final List<NewHotData> pastYearMovieList,
    required final List<NewHotData> trendingMovieList,
    required final List<NewHotData> topTenTvList,
    required final List<NewHotData> tenseDramaList,
    required final List<NewHotData> southIndianList,
    required final bool isLoading,
    required final bool isError,
  }) = _Initial;

  factory HomeState.initial() {
    return const HomeState(
      stateId: '0',
      pastYearMovieList: [],
      trendingMovieList: [],
      topTenTvList: [],
      tenseDramaList: [],
      southIndianList: [],
      isLoading: false,
      isError: false,
    );
  }
}




