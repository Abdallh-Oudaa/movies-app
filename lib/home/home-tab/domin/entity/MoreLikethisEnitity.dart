class MoreLikeThisEntity {
  MoreLikeThisEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,this.statusMessage});


  int? page;
  List<MoreLIkeThisMovie>? results;
  int? totalPages;
  int? totalResults;
String? statusMessage;


}

class MoreLIkeThisMovie {
  MoreLIkeThisMovie({
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
      this.voteCount,});


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