import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/home/watchlist_tab/data/MovieDetailsDto.dart';
import 'package:movie_app/home/watchlist_tab/data/data-source/add_movies_contract.dart';

import '../../../home-tab/data/model/UpcomingMoviesDto.dart';
import '../../../home-tab/domin/entity/UpcomingMoviesEntity.dart';

@Injectable(as: AddMoviesContract)
class MoviesDao extends AddMoviesContract {
  var db = FirebaseFirestore.instance;
  @override
  CollectionReference<UpcomingListMoviesDto> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection("movies")
        .withConverter(
            fromFirestore: (snapshot, options) =>
                UpcomingListMoviesDto.fromJson(snapshot.data() ?? {}),
            toFirestore: (movie, options) => movie.toJson());
  }

  @override
  Future<void> addMoviesToFireStore(ListMoviesEntity movie) async {
    DocumentReference<ListMoviesEntity> dbDocument =
        getMoviesCollection().doc(movie.id.toString());

    await dbDocument.set(movie);
  }

  @override
  Future<List<ListMoviesEntity>?> getMoviesFromFireStore() async {
    var db = await getMoviesCollection().get();
    var docs = db.docs.map(
      (e) {
        return e.data();
      },
    ).toList();
    return docs;
  }
}
