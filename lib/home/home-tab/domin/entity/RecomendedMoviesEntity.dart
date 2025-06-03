import 'UpcomingMoviesEntity.dart';

class RecommendedMoviesEntity {
  RecommendedMoviesEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.statusCode
  });

  int? page;
  List<ListMoviesEntity>? results;
  int? totalPages;
  int? totalResults;
  String? statusCode;
}


