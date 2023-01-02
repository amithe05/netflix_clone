part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingsoonlist,
    required List<HotAndNewData> everyoneiswatching,
    required bool isLoading,
    required bool isError,
  }) = _HotAndNewState;

  factory HotAndNewState.initial() => const HotAndNewState(
      isLoading: false,
      isError: false,
      comingsoonlist: [],
      everyoneiswatching: []);
}
