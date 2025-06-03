import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/home-tab/data/model/MoreLikeThisDto.dart';

import 'package:movie_app/home/home-tab/data/model/PopularMoviesDto.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/home/home-tab/data/model/RecommendMoviesDto.dart';
import 'package:movie_app/home/home-tab/data/model/UpcomingMoviesDto.dart';

import 'api_constant.dart';

@singleton
@injectable
class ApiManger {
  Future<Either<GeneralErrors, PopularMoviesDto>?> getPopularMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
       ApiConstant.baseUrl,ApiConstant.popularMoviesEndPoint,{"api_key":"98d267a289e54bbf5f05b5f0225c764c"}
      );
      var response = await http.get(url);

      var popularMovies = PopularMoviesDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(popularMovies);
      } else {
        return left(ServerErrors(message: popularMovies.statusMessage ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }
  Future<Either<GeneralErrors, UpcomingMoviesDto>?> getUpcomingMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
          ApiConstant.baseUrl,ApiConstant.upcomingMoviesEndPoint,{"api_key":"98d267a289e54bbf5f05b5f0225c764c"}
      );
      var response = await http.get(url);

      var upComingMovies = UpcomingMoviesDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(upComingMovies);
      } else {
        return left(ServerErrors(message: upComingMovies.statusMessage ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }
  Future<Either<GeneralErrors, RecommendMoviesDto>?> getRecommendMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
          ApiConstant.baseUrl,ApiConstant.recommendMoviesEndPoint,{"api_key":"98d267a289e54bbf5f05b5f0225c764c"}
      );
      var response = await http.get(url);

      var recommendMovies = RecommendMoviesDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(recommendMovies);
      } else {
        return left(ServerErrors(message: recommendMovies.statusCode ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

  Future<Either<GeneralErrors, MoreLikeThisDto>?> getMoreLikeThisMovies(int id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
          ApiConstant.baseUrl,"${ApiConstant.movieDetailsEndPoint}/$id/similar",{"api_key":"98d267a289e54bbf5f05b5f0225c764c"}
      );
      var response = await http.get(url);

      var moreLikeThisMovie = MoreLikeThisDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(moreLikeThisMovie);
      } else {
        return left(ServerErrors(message: moreLikeThisMovie.statusMessage ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

}
