part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required List<SearchResultData>? searchresultlist,
      required List<Downloads> idlelist,
      required bool isLoading,
      required bool isError}) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchresultlist: [],
        idlelist: [],
        isLoading: false,
        isError: false,
      );
}
