import 'package:flutter/material.dart';
import 'package:helloworld/WeightProjectScreen.dart';
import 'package:helloworld/home/HomeScreen.dart';
import 'package:helloworld/more_widegts/more_widgets.dart';
import 'package:helloworld/task2/PlanetWeightScreen.dart';
import 'package:helloworld/task3/screen/MovieListScreen.dart';
import 'package:helloworld/task4/stmbloc/ui/BlocHomeScreen.dart';
import 'package:helloworld/task4/stmchangenotifier/CartDemoScreenV2.dart';
import 'package:helloworld/task4/stmnormal/CartDemoScreen.dart';
import 'package:helloworld/task4/stmredux/screens/ReduxHomeScreen.dart';
import 'package:helloworld/task4/stmreduxmiddlware/screens/ReduxMdlWareHomeScreen.dart';
import 'package:helloworld/task5/ui/LoginScreen.dart';
import 'package:helloworld/task5/ui/SignupScreen.dart';
import 'package:helloworld/ui/error/ErrorScreen.dart';
import 'package:helloworld/ui/profilelist/ProfileListScreen.dart';
import 'package:helloworld/ui/splash/SplashScreen.dart';
import 'package:helloworld/utils/Constants.dart';

///  class for route navigation in all over the project
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Constants.ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Constants.ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Constants.ROUTE_SIGNUP:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Constants.ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Constants.ROUTE_PLANET_WEIGHT:
        return MaterialPageRoute(builder: (_) => PlanetWeightScreen());
      case Constants.ROUTE_CART_APP:
        return MaterialPageRoute(builder: (_) => CartDemoScreen());
      case Constants.ROUTE_REDUX_HOME:
        return MaterialPageRoute(builder: (_) => ReduxHomeScreen());
      case Constants.ROUTE_REDUX_HOME_MDLWARE:
        return MaterialPageRoute(builder: (_) => ReduxMdlWareHomeScreen());
      case Constants.ROUTE_BLOC_HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => BlocHomeScreen());
      case Constants.ROUTE_MORE_WIDGETS:
        return MaterialPageRoute(builder: (_) => MoreWidgets());
      case Constants.ROUTE_CART_APP_PROVIDER:
        return MaterialPageRoute(builder: (_) => CartDemoScreenV2());
      case Constants.ROUTE_PROFILE_LIST:
        return MaterialPageRoute(builder: (_) => ProfileListScreen());
      case Constants.ROUTE_MOVIE_LIST:
        return MaterialPageRoute(builder: (_) => MovieListScreen(args));
//        {
//          if (args is String)
//            return MaterialPageRoute(builder: (_) => MovieListScreen(args));
//          else
//            return MaterialPageRoute(builder: (_) => ErrorScreen());
//        }
      case Constants.ROUTE_WEIGHT:
        // you can make argument check here
        return MaterialPageRoute(builder: (_) => WeightProjectScreen());

      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }

  static void navigate(
      BuildContext buildContext, String route, Object arguments) {
    if (route == Constants.ROUTE_HOME || route == Constants.ROUTE_LOGIN) {
      Navigator.of(buildContext)
          .pushReplacementNamed(route, arguments: arguments);
    } else {
      Navigator.of(buildContext).pushNamed(route, arguments: arguments);
    }
  }
}
