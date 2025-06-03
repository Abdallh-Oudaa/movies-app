import 'package:movie_app/home/home-tab/domin/entity/PopulerMoviesEntity.dart';

class PopularMoviesDto extends PopularMoviesEntity {
  PopularMoviesDto({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
    super.statusMessage
  });

  PopularMoviesDto.fromJson(dynamic json) {
    page = json['page'];
    statusMessage=json["status_message"];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MoviesDto extends MoviesEntity {
  MoviesDto({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  MoviesDto.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
