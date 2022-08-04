part of 'new_hot_bloc.dart';

@freezed
class NewHotState with _$NewHotState {
  const factory NewHotState({
    required final List<NewHotData> comingSoonList,
    required final List<NewHotData> everyonesList,
    required final bool isLoading,
    required final bool isError,
  }) = _NewHotState;

  factory NewHotState.initial() => const NewHotState(
        comingSoonList: [],
        everyonesList: [],
        isLoading: false,
        isError: false,
      );
}
