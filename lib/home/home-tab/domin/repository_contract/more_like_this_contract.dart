import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handleing.dart';

import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';

abstract class MoreLikeThisContract{
  Future<Either<GeneralErrors,MoreLikeThisEntity>?> getMovies(int id);
}