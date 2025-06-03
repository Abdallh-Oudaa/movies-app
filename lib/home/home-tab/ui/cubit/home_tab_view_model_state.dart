part of 'home_tab_view_model_cubit.dart';

@immutable
sealed class HomeTabViewModelState {}

final class HomeTabViewModelInitial extends HomeTabViewModelState {}
final class PopularSuccessState extends HomeTabViewModelState {
final  PopularMoviesEntity popularMoviesEntity;
  PopularSuccessState({required this.popularMoviesEntity});
}
final class UpcomingMoviesSuccessState extends HomeTabViewModelState {
  final  UpcomingMoviesEntity upcomingMoviesEntity;
  UpcomingMoviesSuccessState({required this.upcomingMoviesEntity});
}
final class RecommendMoviesSuccessState extends HomeTabViewModelState {
  final  RecommendedMoviesEntity recommendedMoviesEntity;
  RecommendMoviesSuccessState({required this.recommendedMoviesEntity});
}

final class MoreLikeThisSuccessState extends HomeTabViewModelState {
  final  MoreLikeThisEntity moreLikeThisEntity;
  MoreLikeThisSuccessState({required this.moreLikeThisEntity});
}
final class ErrorState extends HomeTabViewModelState {
final  String message;
  ErrorState({required this.message});
}
final class LoadingState extends HomeTabViewModelState {}

