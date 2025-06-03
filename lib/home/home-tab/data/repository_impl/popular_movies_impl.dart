import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/data_sources/data_source_contract.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/popular_movies_contract.dart';
@Injectable(as: PopularMoviesContract)
class PopularMoviesImpl extends PopularMoviesContract{
  DataSourceContract dataSourceContract;
  PopularMoviesImpl({required this.dataSourceContract});
  @override
  Future<Either<GeneralErrors, PopularMoviesEntity>?> getPopularMovies() {
    return dataSourceContract.getPopularMovies();
  }
}