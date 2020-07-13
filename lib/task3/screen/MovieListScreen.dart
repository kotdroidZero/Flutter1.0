import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helloworld/task3/data/api/APIHandler.dart';
import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/task3/data/model/popular/Result.dart';
import 'package:helloworld/task3/data/model/toprated/ResultTop.dart';
import 'package:helloworld/task3/data/model/toprated/TopRatedMovie.dart';
import 'package:helloworld/utils/Constants.dart';

class MovieListScreen extends StatefulWidget {
  /// variables
  final String planetData;

  /// constructor
  MovieListScreen(this.planetData);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  /// variables
  Future<PopularMovie> popularMovie;
  Future<TopRatedMovie> topRatedMovies;

  @override
  void initState() {
    super.initState();
    print("init states");

    /// hit api
    popularMovie = APIHandler.getPopularMovies();
    topRatedMovies = APIHandler.getTopRatedMovies();
  }

  /// Widget to show the movie result data
  Widget _getTopRatedMovieRow(ResultTop result) {
    return Container(
      width: 100.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  Constants.MOVIE_DB_IMAGE_BASE_URL + result.poster_path),
              fit: BoxFit.fitWidth,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  result.title,
                  style: TextStyle(
                      fontFamily: "Raleway", fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Release Date: ${result.release_date}",
                    style: TextStyle(fontSize: 12.0, fontFamily: "Raleway"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Widget to show the movie result data
  Widget _getPopularMovieRow(Result result) {
    return Container(
      width: 100.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  Constants.MOVIE_DB_IMAGE_BASE_URL + result.poster_path),
              fit: BoxFit.fitWidth,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  result.title,
                  style: TextStyle(
                      fontFamily: "Raleway", fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Release Date: ${result.release_date}",
                    style: TextStyle(fontSize: 12.0, fontFamily: "Raleway"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.planetData),
      ),
      body: Container(

        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Movies',
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0),
              ),
            ),
            popularMoviesWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Top Rated Movies',
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0)),
            ),
            topRatedMoviesWidget(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<TopRatedMovie>
  topRatedMoviesWidget() {
    return FutureBuilder<TopRatedMovie>(
      future: topRatedMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int position) {
                  return _getTopRatedMovieRow(snapshot.data.results[position]);
                }),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // default loader
        return CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<PopularMovie> popularMoviesWidget() {
    return FutureBuilder<PopularMovie>(
      future: popularMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int position) {
                  return _getPopularMovieRow(snapshot.data.results[position]);
                }),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // default loader
        return CircularProgressIndicator();
      },
    );
  }
}
