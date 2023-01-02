import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/HotandNew/hot_and_new_service.dart';

import '../../domain/HotandNew/Models/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    on<Loaddataincomingsoon>((event, emit) async {
      emit(
        const HotAndNewState(
          comingsoonlist: [],
          everyoneiswatching: [],
          isLoading: true,
          isError: false,
        ),
      );

      final _result = await _hotAndNewService.gethotandnewmoviedata();
      _result.fold((failure) {
        return emit(HotAndNewState(
            comingsoonlist: [],
            everyoneiswatching: [],
            isLoading: false,
            isError: true));
      }, (success) {
        return emit(HotAndNewState(
            comingsoonlist: success.results,
            everyoneiswatching: state.everyoneiswatching,
            isLoading: false,
            isError: false));
      });
    });
    on<Loaddataineveryonewatching>((event, emit) async {
      emit(
        const HotAndNewState(
          comingsoonlist: [],
          everyoneiswatching: [],
          isLoading: true,
          isError: false,
        ),
      );

      final _result = await _hotAndNewService.gethotandnewtvdata();
      _result.fold((failure) {
        return emit(HotAndNewState(
            comingsoonlist: [],
            everyoneiswatching: [],
            isLoading: false,
            isError: true));
      }, (success) {
        return emit(HotAndNewState(
            comingsoonlist: state.comingsoonlist,
            everyoneiswatching: success.results,
            isLoading: false,
            isError: false));
      });
    });
    
    

  }
}
