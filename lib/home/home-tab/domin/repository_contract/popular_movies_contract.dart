import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';

abstract class PopularMoviesContract{
  Future<Either<GeneralErrors,PopularMoviesEntity>?> getPopularMovies();
}