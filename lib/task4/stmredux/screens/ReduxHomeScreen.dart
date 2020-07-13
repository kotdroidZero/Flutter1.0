import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helloworld/task4/stmredux/AppState.dart';
import 'package:helloworld/task4/stmredux/redux/reducers.dart';
import 'package:helloworld/task4/stmredux/screens/EffectScreen.dart';
import 'package:helloworld/task4/stmredux/screens/SettingScreen.dart';
import 'package:redux/redux.dart';

class ReduxHomeScreen extends StatelessWidget {
  final _initialState = AppState(0.5, false, false);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> _store =
        Store<AppState>(reducers, initialState: _initialState);

    return StoreProvider(
      store: _store,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Settings',
                  ),
                  Tab(
                    text: 'Effects',
                  )
                ],
              ),
              title: Text('Redux Home Screen'),
            ),
            body: TabBarView(
              //physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                SettingScreen(),
                EffectScreen(),
              ],
            ),
          )),
    );
  }
}
