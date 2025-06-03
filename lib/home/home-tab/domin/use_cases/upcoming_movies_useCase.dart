import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';

import '../repository_contract/upcoming_movies_contract.dart';
@injectable
class UpComingMoviesUseCase{
  UpComingMoviesContract upComingMoviesContract;
  UpComingMoviesUseCase({required this.upComingMoviesContract});
  Future<Either<GeneralErrors,UpcomingMoviesEntity>?> invoke(){
    return upComingMoviesContract.getUpcomingMovies();
  }
}