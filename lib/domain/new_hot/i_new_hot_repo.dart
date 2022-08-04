import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/new_hot/model/new_hot_response.dart';

abstract class NewHotService {
  Future<Either<MainFailures, NewHotResponse>> getNewHotMovieData();
  Future<Either<MainFailures, NewHotResponse>> getNewHotTvData();
}
