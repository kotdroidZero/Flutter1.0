import 'package:helloworld/task4/stmreduxmiddlware/AppState.dart';
import 'package:helloworld/task4/stmreduxmiddlware/redux/Action.dart';
import 'package:helloworld/task4/stmreduxmiddlware/redux/Reducer.dart';
import 'package:helloworld/task4/stmreduxmiddlware/states/UserDetailState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState appState, dynamic action) {
  if (action is SetUserDetailStateAction) {
    final nextPostState = reducer(appState.userDetailState, action);

    return appState.copyWith(userDetailState: nextPostState);
  }
  return appState;
}

class Redux {
  static Store<AppState> _store;

  static get store {
    if (_store == null) {
      throw Exception("Store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final userDetailStateInitial = UserDetailState.initial();

    _store = Store<AppState>(appReducer,
        middleware: [thunkMiddleware],
        initialState: AppState(userDetailState: userDetailStateInitial));
  }
}
