import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';

import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/more_like_this_contract.dart';
@injectable
class MoreLikeThisUseCase{
  MoreLikeThisContract moreLikeThisContract;
  MoreLikeThisUseCase(this.moreLikeThisContract);
  Future<Either<GeneralErrors, MoreLikeThisEntity>?> invoke(int id){
    return moreLikeThisContract.getMovies(id);
  }
}