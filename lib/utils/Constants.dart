class Constants {
  /// constants related to Movie DB
  static const MOVIE_DB_BASE_URL = "https://api.themoviedb.org/3/movie/";
  static const MOVIE_DB_IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185/";
  static const MOVIE_DB_API_KEY_V3_AUTH =
      "?api_key=4fccc5c11e3b4a2ba163b94dab4b4181";
  static const MOVIE_DB_API_KEY_V4_AUTH =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmNjYzVjMTFlM2I0YTJiYTE2M2I5NGRhYjRiNDE4MSIsInN1YiI6IjVkMWE2ODgyOGE4NGQyN2YzNWNjYWUzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EYeKgHXO_qOqbr9U1kAEpKZUH04pETGDl5o9aWJ5rAo";

  /// actually this api has pagination but right now I'm using it without pagination
  static const MOVIE_ENDPOINT_POPULAR = "popular";
  static const MOVIE_ENDPOINT_TOP_RATED = "top_rated";

  /// User API
  static const API_URL_GET_USERS = "https://jsonplaceholder.typicode.com/users";

  /// constants related to Route Navigation
  static const String ROUTE_SPLASH = '/';
  static const String ROUTE_WEIGHT = '/weight';
  static const String ROUTE_TEST = '/test';
  static const String ROUTE_HOME = '/home';
  static const String ROUTE_PLANET_WEIGHT = '/planet_weight';
  static const String ROUTE_CART_APP = '/cart_app';
  static const String ROUTE_REDUX_HOME = '/redux_home';
  static const String ROUTE_REDUX_HOME_MDLWARE = '/redux_home_middleware';
  static const String ROUTE_BLOC_HOME_SCREEN = '/bloc_home';
  static const String ROUTE_MORE_WIDGETS = '/more_widgets';
  static const String ROUTE_CART_APP_PROVIDER = '/cart_app_with_provider';
  static const String ROUTE_PROFILE_LIST = '/profile_list';
  static const String ROUTE_MOVIE_LIST = '/movie_list';
  static const String ROUTE_LOGIN = '/login';
  static const String ROUTE_SIGNUP = '/signup';
}
