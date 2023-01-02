import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchResponse({
    this.results = const [],
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResultData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results.map((e) => e.toJson()).toList(),
      };
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      SearchResultData(
        originalTitle: json['original_title'] as String?,
        posterPath: json['poster_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'original_title': originalTitle,
        'poster_path': posterPath,
      };
}
