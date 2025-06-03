import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/home/brows_tab/domin/CategoryDetailsEntity.dart';
import 'package:movie_app/home/brows_tab/domin/categories_use_case.dart';
import 'package:movie_app/home/brows_tab/domin/gategoriesMoviesEntity.dart';
import 'package:movie_app/home/home-tab/ui/cubit/home_tab_view_model_cubit.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  List<String> images = [
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
    "Assets/images/action.png",
    "Assets/images/comdy.png",
    "Assets/images/romance.png",
    "Assets/images/photo.png",
  ];
  CategoriesUseCase categoriesUseCase;
  CategoriesCubit(this.categoriesUseCase) : super(CategoriesInitial());
  void getCategoriesMovies() async {
    var response = await categoriesUseCase.getCategoriesMovies();
    response?.fold((l) {
      Left(emit(CategoriesErrorState(l.message)));
    }, (r) {
      right(emit(CategoriesSuccessState(r, images)));
    });
  }

  void getCategoryDetails(int id) async {
    var response = await categoriesUseCase.getCategoryDetails(id);
    response?.fold((l) {
      Left(emit(CategoriesErrorState(l.message)));
    }, (r) {
      right(emit(CategoryDetailsSuccessState(r)));
    });
  }
}
