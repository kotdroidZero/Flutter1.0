import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helloworld/task4/stmreduxmiddlware/AppState.dart';
import 'package:helloworld/task4/stmreduxmiddlware/redux/Store.dart';

import 'UserActionScreen.dart';
import 'UserDetailListScreen.dart';

class ReduxMdlWareHomeScreen extends StatefulWidget {
  @override
  _ReduxMdlWareHomeScreenState createState() => _ReduxMdlWareHomeScreenState();
}

class _ReduxMdlWareHomeScreenState extends State<ReduxMdlWareHomeScreen> {
  @override
  void initState() {
    Redux.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Redux.store,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'User Action',
                  ),
                  Tab(
                    text: 'Effects',
                  )
                ],
              ),
              title: Text('Redux Thunk Home'),
            ),
            body: TabBarView(
              //physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                UserActionScreen(),
                UserDetailListScreen(),
              ],
            ),
          )),
    );
  }
}
