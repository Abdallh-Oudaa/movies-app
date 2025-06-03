part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {
 
}
final class SuccessState extends SearchState {
 final List<ListMoviesEntity> recommendListMoviesEntity;
  SuccessState(this.recommendListMoviesEntity);
}
final class ErrorState extends SearchState {
 final String message ;
 ErrorState(this.message);
}