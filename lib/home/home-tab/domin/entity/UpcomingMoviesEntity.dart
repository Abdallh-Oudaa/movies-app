class UpcomingMoviesEntity {
  UpcomingMoviesEntity(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusMessage});

  Dates? dates;
  int? page;
  List<ListMoviesEntity>? results;
  int? totalPages;
  int? totalResults;
  String? statusMessage;
}

class ListMoviesEntity {
  ListMoviesEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  String? maximum;
  String? minimum;
}
