import 'dart:convert';

import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/task3/data/model/toprated/TopRatedMovie.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:http/http.dart';

/// thi class is similar to API interface in out Android Projects
class APIHandler {
  /// get Popular Movies
  static Future<PopularMovie> getPopularMovies() async {
    print("in top movies");
    String url = Constants.MOVIE_DB_BASE_URL +
        Constants.MOVIE_ENDPOINT_POPULAR +
        Constants.MOVIE_DB_API_KEY_V3_AUTH;

    print("in pop movies $url");

    /// get Response
    var response = await get(
        // encode url
        Uri.encodeFull(url),
        // only accept json response
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return PopularMovie.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to connect");
    }
  }

  /// get Top-Rated Movies
  static Future<TopRatedMovie> getTopRatedMovies() async {
    String url = Constants.MOVIE_DB_BASE_URL +
        Constants.MOVIE_ENDPOINT_TOP_RATED +
        Constants.MOVIE_DB_API_KEY_V3_AUTH;

    print("in top movies $url");

    /// get Response
    var response = await get(
        // encode url
        Uri.encodeFull(url),
        // only accept json response
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return TopRatedMovie.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to connect");
    }
  }
}
