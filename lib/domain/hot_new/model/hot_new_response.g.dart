// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_new_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotNewResponse _$HotNewResponseFromJson(Map<String, dynamic> json) =>
    HotNewResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HotNewData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HotNewResponseToJson(HotNewResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

HotNewData _$HotNewDataFromJson(Map<String, dynamic> json) => HotNewData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$HotNewDataToJson(HotNewData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
