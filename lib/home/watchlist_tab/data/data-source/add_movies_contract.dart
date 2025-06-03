import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/home/home-tab/data/model/UpcomingMoviesDto.dart';
import 'package:movie_app/home/watchlist_tab/data/MovieDetailsDto.dart';

import '../../../home-tab/domin/entity/UpcomingMoviesEntity.dart';

abstract class AddMoviesContract{
  CollectionReference<UpcomingListMoviesDto> getMoviesCollection();
  Future<void> addMoviesToFireStore(ListMoviesEntity movie);
  Future<List<ListMoviesEntity>?> getMoviesFromFireStore();
}