import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';

abstract class RecommendMoviesContract {
  Future<Either<GeneralErrors,RecommendedMoviesEntity>?> getRecommendMovies();

}