import 'dart:convert';

import 'package:helloworld/task4/stmreduxmiddlware/AppState.dart';
import 'package:helloworld/task4/stmreduxmiddlware/model/UsersDetail.dart';
import 'package:helloworld/task4/stmreduxmiddlware/states/UserDetailState.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

class SetUserDetailStateAction {
  final UserDetailState payload;

  SetUserDetailStateAction(this.payload);
}


Future<void> fetchUserListAction(Store<AppState> store) async {
  store.dispatch(SetUserDetailStateAction(UserDetailState(isLoading: true)));

  try {
    final response = await get(
      // encode url
        Uri.encodeFull(Constants.API_URL_GET_USERS),
        // only accept json response
        headers: {"Accept": "application/json"});

    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetUserDetailStateAction(
        UserDetailState(
          isLoading: false,
          userList: UsersDetail.listFromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(
        SetUserDetailStateAction(UserDetailState(isLoading: false)));
  }
}
