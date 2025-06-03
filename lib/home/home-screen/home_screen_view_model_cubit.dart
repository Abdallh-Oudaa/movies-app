import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/home/brows_tab/ui/brows_tab_view.dart';
import 'package:movie_app/home/home-tab/ui/home_tab_view.dart';
import 'package:movie_app/home/search_tab/search_tab_view.dart';
import 'package:movie_app/home/watchlist_tab/ui/watchlist_tab_view.dart';

part 'home_screen_view_model_state.dart';

class HomeScreenViewModelCubit extends Cubit<HomeScreenViewModelState> {
  List<Widget> screens=[ const HomeTabView(), SearchTabView(), BrowsTabView(), WatchlistTabView()];
  int currentIndex=0;
  HomeScreenViewModelCubit() : super(HomeScreenViewModelInitial());
  void changeTabs(int newIndex){
    currentIndex=newIndex;
    emit(ChangeTabs());
  }
}
