import 'package:dartz/dartz.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';

import '../../../../core/error_handleing.dart';

abstract class UpComingMoviesContract{
  Future<Either<GeneralErrors,UpcomingMoviesEntity>?> getUpcomingMovies();

}