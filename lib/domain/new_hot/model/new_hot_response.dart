import 'package:json_annotation/json_annotation.dart';
part 'new_hot_response.g.dart';

@JsonSerializable()
class NewHotResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<NewHotData> results;

  NewHotResponse({
    this.page,
    this.results = const [],
  });

  factory NewHotResponse.fromJson(Map<String, dynamic> json) {
    return _$NewHotResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewHotResponseToJson(this);
}

@JsonSerializable()
class NewHotData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  // -- // -- in everyones section, use original_title
  @JsonKey(name: 'original_title')
  String? originalTitle;

  // -- in everyones section, use original_name instead of original_title
  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  NewHotData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory NewHotData.fromJson(Map<String, dynamic> json) {
    return _$NewHotDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewHotDataToJson(this);
}
