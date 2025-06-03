import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/brows_tab/data/categoris_data_source.dart';
import 'package:movie_app/home/brows_tab/domin/CategoryDetailsEntity.dart';
import 'package:movie_app/home/brows_tab/domin/category_repo_contract.dart';

import '../domin/gategoriesMoviesEntity.dart';
@Injectable(as: CategoryRepoContract)
class CategoriesRepoImpl extends CategoryRepoContract{
  CategoriesDataSource categoriesDataSource;
  CategoriesRepoImpl({required this.categoriesDataSource});
  @override
  Future<Either<GeneralErrors, List<GenresEntity>>?> getCategoriesMovies()async{
    var response= await categoriesDataSource.getCategoriesMovies();
    return response?.fold((l) => left(l), (r) {
      return right(r.map((e) => e.toGenresEntity(),).toList());
    },);
  }
  @override
  Future<Either<GeneralErrors, CategoryDetailsEntity>?> getCategoryDetails(int id)async{
    var response= await categoriesDataSource.getCategoryDetails(id);
    return response?.fold((l) => left(l), (r) {
      return right(r);
    },);
  }
}