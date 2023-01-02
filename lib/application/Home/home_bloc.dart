import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/HotandNew/hot_and_new_service.dart';

import '../../domain/HotandNew/Models/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeservice;
  HomeBloc(this._homeservice) : super(HomeState.initial()) {
    on<Gethomescreendata>((event, emit) async {
      emit(const HomeState(
          stateid: '0',
          pastyearmovielist: [],
          trendingmovielist: [],
          tensedramemovielist: [],
          southIndianmovielist: [],
          trendingTvlist: [],
          isloading: true,
          hasError: false));

      final _moviedata = await _homeservice.gethotandnewmoviedata();
      final _tvdata = await _homeservice.gethotandnewtvdata();

      final _state1 = _moviedata.fold((failure) {
        return (HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmovielist: [],
            trendingmovielist: [],
            tensedramemovielist: [],
            southIndianmovielist: [],
            trendingTvlist: [],
            isloading: false,
            hasError: true));
      }, (response) {
        final pastYear = response.results;
        final trending = response.results;
        final dramas = response.results;
        final southIndian = response.results;

        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();

        southIndian.shuffle();

        return (HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmovielist: pastYear,
            trendingmovielist: trending,
            tensedramemovielist: dramas,
            southIndianmovielist: southIndian,
            trendingTvlist: state.trendingTvlist,
            isloading: false,
            hasError: false));
      });
      emit(_state1);

      final _state2 = _tvdata.fold((failure) {
        return (HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmovielist: [],
            trendingmovielist: [],
            tensedramemovielist: [],
            southIndianmovielist: [],
            trendingTvlist: [],
            isloading: false,
            hasError: true));
      }, (resp) {
        final top10list = resp.results;
        top10list.shuffle;
        return (HomeState(
            stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmovielist: state.pastyearmovielist,
            trendingmovielist: state.trendingmovielist,
            tensedramemovielist: state.tensedramemovielist,
            southIndianmovielist: state.southIndianmovielist,
            trendingTvlist: top10list,
            isloading: false,
            hasError: false));
      });
      emit(_state2);
    });
  }
}
