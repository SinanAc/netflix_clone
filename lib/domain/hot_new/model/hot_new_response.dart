import 'package:json_annotation/json_annotation.dart';
part 'hot_new_response.g.dart';

@JsonSerializable()
class HotNewResponse {

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<HotNewData>? results;


  HotNewResponse({
    this.page,
    this.results=const[],
  });

  factory HotNewResponse.fromJson(Map<String, dynamic> json) {
    return _$HotNewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewResponseToJson(this);
}



@JsonSerializable()
class HotNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
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


  HotNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    });

  factory HotNewData.fromJson(Map<String, dynamic> json) {
    return _$HotNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewDataToJson(this);
}
