class CategoriesMoviesEntity {
  CategoriesMoviesEntity({
    this.genres,this.statusMessage
  });

  List<GenresEntity>? genres;
  String? statusMessage;
}

class GenresEntity {
  GenresEntity({
    this.id,
    this.name,
  });

  int? id;
  String? name;
}
