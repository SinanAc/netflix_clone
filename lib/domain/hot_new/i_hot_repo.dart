import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_new/model/hot_new_response.dart';

abstract class HoTNewService{
  Future<Either<MainFailures,HotNewResponse>> getHotNewMovieData();
  Future<Either<MainFailures,HotNewResponse>> getHotNewTvData();
}