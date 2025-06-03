import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/home/home-tab/domin/entity/MoreLikethisEnitity.dart';
import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/use_cases/more_like_this_uesCase.dart';

import 'package:movie_app/home/home-tab/domin/use_cases/popular_movies_useCase.dart';
import 'package:movie_app/home/home-tab/domin/use_cases/recommend_use_case.dart';
import 'package:movie_app/home/home-tab/domin/use_cases/upcoming_movies_useCase.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_tab_view_model_state.dart';

@injectable

class HomeTabViewModelCubit extends Cubit<HomeTabViewModelState> {
  PopularMoviesUseCase popularMoviesUseCase;
  UpComingMoviesUseCase upComingMoviesUseCase;
  RecommendUseCase recommendUseCase;

  MoreLikeThisUseCase moreLikeThisUseCase;
  String? homePagePath;
  HomeTabViewModelCubit(
      {required this.popularMoviesUseCase,
      required this.upComingMoviesUseCase,
      required this.recommendUseCase,required this.moreLikeThisUseCase})
      : super(HomeTabViewModelInitial());
  void getPopularMovies() async {
    var response = await popularMoviesUseCase.invoke();
    response?.fold((l) {
      Left(emit(ErrorState(message: l.message)));
    }, (r) {
      right(emit(PopularSuccessState(popularMoviesEntity: r)));
    });
  }

  void getUpcomingMovies() async {
    var response = await upComingMoviesUseCase.invoke();
    response?.fold((l) {
      Left(emit(ErrorState(message: l.message)));
    }, (r) {
      right(emit(UpcomingMoviesSuccessState(upcomingMoviesEntity: r)));
    });
  }

  void getRecommendMovies() async {
    var response = await recommendUseCase.invoke();
    response?.fold((l) {
      Left(emit(ErrorState(message: l.message)));
    }, (r) {
      right(emit(RecommendMoviesSuccessState(recommendedMoviesEntity: r)));
    });
  }


  void getMoreLikeThisMovies(int id) async {
    var response = await moreLikeThisUseCase.invoke(id);
    response?.fold((l) {
      Left(emit(ErrorState(message: l.message)));
    }, (r) {

      right(emit(MoreLikeThisSuccessState(moreLikeThisEntity: r)));
    });
  }
  Future<void> launchWebSite() async {
    final Uri url = Uri.parse(homePagePath??"");

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }}
}
