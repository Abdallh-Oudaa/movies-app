import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api_constant.dart';
import 'package:movie_app/core/error_handleing.dart';
import 'package:movie_app/home/brows_tab/data/CategoriesMoviesDto.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/home/brows_tab/data/CategoryDetailsDto.dart';

@singleton
class CategoriesDataSource {
  Future<Either<GeneralErrors, List<GenrsDto>>?> getCategoriesMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.categoriesMovies, {
        "api_key": "98d267a289e54bbf5f05b5f0225c764c",
      });
      var response = await http.get(url);

      var categories = CategoriesMoviesDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(categories.genres ?? []);
      } else {
        return left(ServerErrors(message: categories.statusMessage ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }

  Future<Either<GeneralErrors, CategoryDetailsDto>?> getCategoryDetails(
      int id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.categoryDetails, {
        "api_key": "98d267a289e54bbf5f05b5f0225c764c",
        "with_genres": "$id"
      });
      var response = await http.get(url);

      var categoryDetails = CategoryDetailsDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Right(categoryDetails);
      } else {
        return left(ServerErrors(message: categoryDetails.statusMessage ?? ""));
      }
    } else {
      return left(NetworkError(message: "please check the network"));
    }
  }
}
