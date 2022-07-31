import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/url.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchResponse({
    this.results = const [],
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  get posterImageUrl => '$imageAppendUrl$posterPath';

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
