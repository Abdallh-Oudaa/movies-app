import 'package:movie_app/home/brows_tab/domin/CategoryDetailsEntity.dart';

class CategoryDetailsDto extends CategoryDetailsEntity {
  CategoryDetailsDto(
      {super.page,
      super.results,
      super.totalPages,
      super.totalResults,
      super.statusMessage});

  CategoryDetailsDto.fromJson(dynamic json) {
    page = json['page'];
    statusMessage = json["status_message"];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(CategoriesListMoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class CategoriesListMoviesDto extends CategoryDetailsListEntity {
  CategoriesListMoviesDto({
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

  CategoriesListMoviesDto.fromJson(dynamic json) {
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
