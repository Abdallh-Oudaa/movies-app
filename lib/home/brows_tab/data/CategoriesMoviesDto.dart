import 'package:movie_app/home/brows_tab/domin/gategoriesMoviesEntity.dart';

class CategoriesMoviesDto {
  CategoriesMoviesDto({
      this.genres,this.statusMessage});

  CategoriesMoviesDto.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenrsDto.fromJson(v));
      });
    }
    statusMessage=json["status_message"];
  }
  List<GenrsDto>? genres;
  String? statusMessage;



}

class GenrsDto {
  GenrsDto({
      this.id,
      this.name,});

  GenrsDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

GenresEntity toGenresEntity(){
  return GenresEntity(id: id,name: name);
}

}