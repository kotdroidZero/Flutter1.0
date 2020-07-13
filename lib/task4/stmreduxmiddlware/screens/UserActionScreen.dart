import 'package:flutter/material.dart';
import 'package:helloworld/task4/stmreduxmiddlware/redux/Action.dart';
import 'package:helloworld/task4/stmreduxmiddlware/redux/Store.dart';

class UserActionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Center(
          child: Container(
            child: RaisedButton(
              child: Text("Get User List"),
              onPressed: () {
//                StoreProvider.of<AppState>(context)
//                    .dispatch(fetchUserListAction(Redux.store));
                Redux.store.dispatch(fetchUserListAction);
              },
            ),
          ),
        ));
  }
}
