import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api-manger.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/data_sources/data_source_contract.dart';

import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';

@Injectable(as: DataSourceContract)
class DataSourceImpl extends DataSourceContract {
  ApiManger apiManger;
  DataSourceImpl({required this.apiManger});
  @override
  Future<Either<GeneralErrors, PopularMoviesEntity>?> getPopularMovies() async {
    var response = await apiManger.getPopularMovies();
    return response?.fold(
        (error) => Left(error), (successResponse) => Right(successResponse));
  }

  @override
  Future<Either<GeneralErrors, UpcomingMoviesEntity>?>
      getUpcomingMovies() async {
    var response = await apiManger.getUpcomingMovies();
    return response?.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<GeneralErrors, RecommendedMoviesEntity>?>
      getRecommendMovies() async {
    var response = await apiManger.getRecommendMovies();
    return response?.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override


  @override
  Future<Either<GeneralErrors, MoreLikeThisEntity>?> getMovies(int id)async {
 return await apiManger.getMoreLikeThisMovies(id);
  }
}
