import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/home/home-tab/domin/entity/RecomendedMoviesEntity.dart';
import 'package:movie_app/home/home-tab/domin/use_cases/recommend_use_case.dart';

import '../../home-tab/domin/entity/UpcomingMoviesEntity.dart';
import '../../home-tab/ui/cubit/home_tab_view_model_cubit.dart';

part 'search_state.dart';
@injectable
class SearchCubit extends Cubit<SearchState> {
 List<ListMoviesEntity> movies=[];
  TextEditingController search=TextEditingController();
  RecommendUseCase recommendUseCase;
  SearchCubit(this.recommendUseCase) : super(SearchInitial()){
    search.addListener(() {
      final text= search.text;
      filter(text);
    },);
  }
  void getRecommendMovies() async {
    var response = await recommendUseCase.invoke();
    response?.fold((l) {
      Left(emit(ErrorState( l.message)));
    }, (r) {
      movies=r.results??[];
      right(emit(SuccessState(r.results??[])));
    });
  }
  void filter(String text) {
    final result = movies.where((element) {
      final nameLower=element.title?.toLowerCase();
      final textLower=text.toLowerCase();
      return nameLower!.contains(textLower);
    }).toList();

    emit(SuccessState( result));
  }
}
