import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/data_sources/data_source_contract.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/upcoming_movies_contract.dart';
@Injectable(as:  UpComingMoviesContract)
class UpcomingMoviesImpl extends UpComingMoviesContract{
  DataSourceContract dataSourceContract;
  UpcomingMoviesImpl({required this.dataSourceContract});
  @override
  Future<Either<GeneralErrors, UpcomingMoviesEntity>?> getUpcomingMovies() {
   return dataSourceContract.getUpcomingMovies();
  }

}