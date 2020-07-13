import 'package:flutter/material.dart';
import 'package:helloworld/task3/data/model/popular/PopularMovie.dart';
import 'package:helloworld/task3/data/model/popular/Result.dart';
import 'package:helloworld/task4/stmbloc/blocs/movie_block.dart';
import 'package:helloworld/utils/Constants.dart';

class BlocHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bloc Pattern'),
      ),
      body: Container(
        child: Column(
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
            StreamBuilder(
              stream: bloc.allMovies,
              builder: (context, AsyncSnapshot<PopularMovie> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.results.length,
                        itemBuilder: (BuildContext context, int position) {
                          return _getPopularMovieRow(
                              snapshot.data.results[position]);
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }

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
                    "Release Date: ${result}",
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
}
