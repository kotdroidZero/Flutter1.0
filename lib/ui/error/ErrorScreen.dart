import 'package:flutter/material.dart';

/// this is basic class for errors, a error screen
class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("Some error occured."),
      ),
    );
  }
}
