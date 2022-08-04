part of 'new_hot_bloc.dart';

@freezed
class NewHotEvent with _$NewHotEvent {
  const factory NewHotEvent.loadDataInComingSoon() = LoadDataInComingSoon;
  const factory NewHotEvent.loadDataInEveryones() = LoadDataInEveryones;
}
