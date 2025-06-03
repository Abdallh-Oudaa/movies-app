part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesSuccessState extends CategoriesState {
final  List<GenresEntity> genresEntity;
final List<String> images;
  CategoriesSuccessState(this.genresEntity,this.images);
}
final class CategoryDetailsSuccessState extends CategoriesState {
  final  CategoryDetailsEntity categoryDetailsEntity;

  CategoryDetailsSuccessState(this.categoryDetailsEntity);
}
final class CategoriesErrorState extends CategoriesState {
 final String message;
  CategoriesErrorState(this.message);
}


