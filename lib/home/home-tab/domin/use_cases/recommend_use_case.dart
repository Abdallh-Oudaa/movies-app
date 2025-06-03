import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';

import '../repository_contract/recommend_cotracat.dart';
@injectable
class RecommendUseCase{
  RecommendMoviesContract recommendMoviesContract;
  RecommendUseCase({required this.recommendMoviesContract});
  Future<Either<GeneralErrors,RecommendedMoviesEntity>?> invoke(){
    return recommendMoviesContract.getRecommendMovies();
  }
}

