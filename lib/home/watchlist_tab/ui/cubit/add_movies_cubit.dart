import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/home/watchlist_tab/data/add_movies_repo_impl.dart';

import '../../../home-tab/domin/entity/UpcomingMoviesEntity.dart';

part 'add_movies_state.dart';

@injectable
class AddMoviesCubit extends Cubit<AddMoviesState> {
  final AddMoviesRepoImpl addMoviesRepoImpl;

  AddMoviesCubit(this.addMoviesRepoImpl) : super(AddMoviesInitial());

  void addMovies(ListMoviesEntity movie) async {
    return await addMoviesRepoImpl.addMovies(movie);
  }

  void getMoviesList() async {
    var response = await addMoviesRepoImpl.getMovies();
    if (response!.isNotEmpty) {
      emit(AddMoviesSuccess(listMoviesEntity: response));
    } else {
      emit(AddMoviesError(message: "error"));
    }
  }
}
