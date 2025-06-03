import 'package:injectable/injectable.dart';
import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';
import 'package:movie_app/home/watchlist_tab/data/MovieDetailsDto.dart';
import 'package:movie_app/home/watchlist_tab/data/data-source/add_movies_contract.dart';
@injectable
class AddMoviesRepoImpl{
  AddMoviesContract addMoviesContract;
  AddMoviesRepoImpl(this.addMoviesContract);
  Future<void> addMovies(ListMoviesEntity movie){
   return addMoviesContract.addMoviesToFireStore(movie);
  }
  Future<List<ListMoviesEntity>?> getMovies(){
    return addMoviesContract.getMoviesFromFireStore();
  }
}