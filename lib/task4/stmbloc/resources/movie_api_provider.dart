import 'dart:convert';

import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();

  String url = Constants.MOVIE_DB_BASE_URL +
      Constants.MOVIE_ENDPOINT_POPULAR +
      Constants.MOVIE_DB_API_KEY_V3_AUTH;

  Future<PopularMovie> fetchPopularMovies() async {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PopularMovie.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
