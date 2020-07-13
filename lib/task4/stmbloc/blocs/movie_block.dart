import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/task4/stmbloc/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final _repo = Repository();

  final _movieFetcher = PublishSubject<PopularMovie>();

  Stream<PopularMovie> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    PopularMovie popularMovie = await _repo.fetchAllPopularMovies();
    _movieFetcher.sink.add(popularMovie);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MovieBloc();
