import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/hot_new/i_hot_repo.dart';
import 'package:netflix_clone/domain/hot_new/model/hot_new_response.dart';


@LazySingleton(as: HoTNewService)
class HotNewRepo implements HoTNewService{
  @override
  Future<Either<MainFailures, HotNewResponse>> getHotNewMovieData() async{
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotNewMovie, 
          // queryParameters: 
          // {'query': movieQuery}
          );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    }
    on DioError catch (_) {
      return const Left(MainFailures.clientFailure());
    }
     catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotNewResponse>> getHotNewTvData() async{
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotNewTv, 
          // queryParameters: 
          // {'query': movieQuery}
          );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    }
    on DioError catch (_) {
      return const Left(MainFailures.clientFailure());
    }
     catch (_) {
      return const Left(MainFailures.clientFailure());
    }
  }
  
}