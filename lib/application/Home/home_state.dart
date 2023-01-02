part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {
        required String stateid,
        required List<HotAndNewData> pastyearmovielist,
      required List<HotAndNewData> trendingmovielist,
      required List<HotAndNewData> tensedramemovielist,
      required List<HotAndNewData> southIndianmovielist,
      required List<HotAndNewData> trendingTvlist,
      required bool isloading,
      required bool hasError}) = _HomeState;

  factory HomeState.initial() => const HomeState(
    stateid: '0',
      pastyearmovielist: [],
      trendingmovielist: [],
      tensedramemovielist: [],
      southIndianmovielist: [],
      trendingTvlist: [],
      isloading: false,
      hasError: false);
}
