import 'package:helloworld/task4/stmreduxmiddlware/redux/Action.dart';
import 'package:helloworld/task4/stmreduxmiddlware/states/UserDetailState.dart';

reducer(UserDetailState prevState, SetUserDetailStateAction action) {
  final payload = action.payload;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    userList: payload.userList,
  );
}
