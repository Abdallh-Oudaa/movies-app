import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handleing.dart';

import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';



abstract class DataSourceContract{
  Future<Either<GeneralErrors,PopularMoviesEntity>?> getPopularMovies();
  Future<Either<GeneralErrors,UpcomingMoviesEntity>?> getUpcomingMovies();
  Future<Either<GeneralErrors,RecommendedMoviesEntity>?> getRecommendMovies();

  Future<Either<GeneralErrors,MoreLikeThisEntity>?> getMovies(int id);

}