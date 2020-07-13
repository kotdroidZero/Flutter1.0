import 'package:flutter/material.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:helloworld/utils/routegenerator/RouteGenerator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
//      Navigator.of(context).pushReplacement(MaterialPageRoute(
//          builder: (BuildContext context) => WeightProjectScreen()));
      RouteGenerator.navigate(context, Constants.ROUTE_HOME, "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage("assets/images/profile.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 300.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
