import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/task4/stmbloc/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<PopularMovie> fetchAllPopularMovies() =>
      moviesApiProvider.fetchPopularMovies();

  
}
