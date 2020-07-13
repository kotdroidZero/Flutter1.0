import 'package:flutter/material.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:helloworld/utils/routegenerator/RouteGenerator.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlutterLogo(
                      size: 100.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                      child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Enter Email")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              counterStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Enter Password")),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 16.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.teal,
                            onPressed: () {},
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        RouteGenerator.navigate(
                            context, Constants.ROUTE_SIGNUP, "");
                      },
                      child: Text(
                        "New member ? Register here.",
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
