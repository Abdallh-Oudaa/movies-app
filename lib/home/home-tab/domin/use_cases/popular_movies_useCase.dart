import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/popular_movies_contract.dart';
@injectable
class PopularMoviesUseCase{
  PopularMoviesContract popularMoviesContract;
  PopularMoviesUseCase({required this.popularMoviesContract});
  Future<Either<GeneralErrors,PopularMoviesEntity>?> invoke(){
    return popularMoviesContract.getPopularMovies();
  }

}