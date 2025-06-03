import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/data_sources/data_source_contract.dart';
import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';
import 'package:movie_app/home/home-tab/domin/repository_contract/more_like_this_contract.dart';
@Injectable(as:MoreLikeThisContract )
class MoreLikeThisImpl extends MoreLikeThisContract{
  DataSourceContract dataSourceContract;
  MoreLikeThisImpl(this.dataSourceContract);
  @override
  Future<Either<GeneralErrors, MoreLikeThisEntity>?> getMovies(int id) {
    return dataSourceContract.getMovies(id);
  }
}