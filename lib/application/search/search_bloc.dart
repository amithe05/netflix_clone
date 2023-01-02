import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads..dart';
import '../../domain/search/models/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownlaodsRepo _downloadservice;
  final SearchService _searchService;
  SearchBloc(this._downloadservice, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idlelist.isNotEmpty) {
        emit(SearchState(
            searchresultlist: [],
            idlelist: state.idlelist,
            isLoading: false,
            isError: false));
        return;
      }

      emit(const SearchState(
        searchresultlist: [],
        idlelist: [],
        isLoading: true,
        isError: false,
      ));

      final result = await _downloadservice.getdownloadsimage();

      result.fold((MainFailure l) {
        emit(const SearchState(
            searchresultlist: [],
            idlelist: [],
            isLoading: false,
            isError: true));
      }, (List<Downloads> list) {
        emit(SearchState(
            searchresultlist: [],
            idlelist: list,
            isLoading: false,
            isError: false));
      });
    });

    // Searchstate
    on<Searchmovie>((event, emit) async {
      emit(const SearchState(
        searchresultlist: [],
        idlelist: [],
        isLoading: true,
        isError: false,
      ));
      final result =
          await _searchService.searchmovies(movieQuery: event.movieQuery);
      result.fold(
        (MainFailure l) {
          return emit(const SearchState(
              searchresultlist: [],
              idlelist: [],
              isLoading: false,
              isError: true));
        },
        (SearchResponse r) {
          return emit(SearchState(
              searchresultlist: r.results,
              idlelist: [],
              isLoading: false,
              isError: false));
        },
      );
    });
  }
}
