import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/new_hot/i_new_hot_repo.dart';
import 'package:netflix_clone/domain/new_hot/model/new_hot_response.dart';

@LazySingleton(as: NewHotService)
class NewHotRepo implements NewHotService {
  @override
  Future<Either<MainFailures, NewHotResponse>> getNewHotMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.hotNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewHotResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } on DioError catch (_) {
      return const Left(MainFailures.clientFailure());
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, NewHotResponse>> getNewHotTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewHotResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } on DioError catch (_) {
      return const Left(MainFailures.clientFailure());
    } catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
