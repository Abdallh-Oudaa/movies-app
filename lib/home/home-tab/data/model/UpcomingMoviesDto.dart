import 'package:movie_app/home/home-tab/domin/entity/UpcomingMoviesEntity.dart';

class UpcomingMoviesDto extends UpcomingMoviesEntity {
  UpcomingMoviesDto({
    super.dates,
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
    super.statusMessage,
  });

  UpcomingMoviesDto.fromJson(dynamic json) {
    dates = json['dates'] != null ? DatesDto.fromJson(json['dates']) : null;
    page = json['page'];
    statusMessage = json['status_message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(UpcomingListMoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class UpcomingListMoviesDto extends ListMoviesEntity {
  UpcomingListMoviesDto({
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

  UpcomingListMoviesDto.fromJson(dynamic json) {
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
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

class DatesDto extends Dates {
  DatesDto({
    super.maximum,
    super.minimum,
  });

  DatesDto.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}
