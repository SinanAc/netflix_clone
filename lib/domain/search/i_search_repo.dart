import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/search/search_response/search_response.dart';

abstract class SearchService{
  Future<Either<MainFailures,SearchResponse>>searchMovies({
    required String movieQuery,
  });
}