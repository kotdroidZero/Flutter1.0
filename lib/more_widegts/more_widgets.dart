import 'package:flutter/material.dart';

class MoreWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getSafeArea();
  }
}

/// Widget SafeArea

Widget getSafeArea() {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: Text("More Widgets"),
      ),
      body: getWrapWidget(),
    ),
  );
}

/// Expanded Widget

Widget getWrapWidget() {
  return Wrap(
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
      Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: 80,
        color: Colors.teal,
      ),
    ],
  );
}
