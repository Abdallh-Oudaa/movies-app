import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/data_sources/data_source_contract.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/recommend_cotracat.dart';
@Injectable(as:  RecommendMoviesContract)
class RecommendRepoImpl extends RecommendMoviesContract{
  DataSourceContract dataSourceContract;
  RecommendRepoImpl(this.dataSourceContract);
  @override
  Future<Either<GeneralErrors, RecommendedMoviesEntity>?> getRecommendMovies() {
    return dataSourceContract.getRecommendMovies();
  }

}