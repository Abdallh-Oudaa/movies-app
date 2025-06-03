part of 'add_movies_cubit.dart';

@immutable
sealed class AddMoviesState {}

final class AddMoviesInitial extends AddMoviesState {}

final class AddMoviesSuccess extends AddMoviesState {
  final List<ListMoviesEntity> listMoviesEntity;
  AddMoviesSuccess({required this.listMoviesEntity});
}

final class AddMoviesError extends AddMoviesState {
  final String message;
  AddMoviesError({required this.message});
}

final class AddMoviesLoading extends AddMoviesState {}
