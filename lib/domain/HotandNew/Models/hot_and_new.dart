import 'package:freezed_annotation/freezed_annotation.dart';

part 'hot_and_new.g.dart';

@JsonSerializable()
class HotAndNew {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<HotAndNewData> results;

  HotAndNew({this.page, this.results = const []});

  factory HotAndNew.fromJson(Map<String, dynamic> json) => HotAndNew(
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>)
            .map((e) => HotAndNewData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results.map((e) => e.toJson()).toList(),
      };
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  

  // use in case of tv
  @JsonKey(name: 'original_name')
  String? originalName;
@JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  HotAndNewData({
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.originalName,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) => HotAndNewData(
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        originalName: json['original_name']as String?,
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'original_name':originalName
      };
}
