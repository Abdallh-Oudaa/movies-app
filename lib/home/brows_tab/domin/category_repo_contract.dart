import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/brows_tab/domin/CategoryDetailsEntity.dart';
import 'package:movie_app/home/brows_tab/domin/gategoriesMoviesEntity.dart';

abstract class CategoryRepoContract{
  Future<Either<GeneralErrors, List<GenresEntity>>?> getCategoriesMovies();
  Future<Either<GeneralErrors,CategoryDetailsEntity>?> getCategoryDetails(int id);

}