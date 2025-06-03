import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/brows_tab/domin/CategoryDetailsEntity.dart';
import 'package:movie_app/home/brows_tab/domin/category_repo_contract.dart';
import 'package:movie_app/home/brows_tab/domin/gategoriesMoviesEntity.dart';


@injectable
class CategoriesUseCase{
  CategoryRepoContract categoryRepoContract;
  CategoriesUseCase({required this.categoryRepoContract});
  Future<Either<GeneralErrors, List<GenresEntity>>?> getCategoriesMovies(){
   return categoryRepoContract.getCategoriesMovies();
  }
  Future<Either<GeneralErrors, CategoryDetailsEntity>?> getCategoryDetails(int id){
    return categoryRepoContract.getCategoryDetails(id);
  }
}