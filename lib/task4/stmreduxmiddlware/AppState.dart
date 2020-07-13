import 'package:flutter/cupertino.dart';
import 'package:helloworld/task4/stmreduxmiddlware/states/UserDetailState.dart';

@immutable
class AppState {
  final UserDetailState userDetailState;

  AppState({@required this.userDetailState});

  AppState copyWith({UserDetailState userDetailState}) {
    return AppState(userDetailState: userDetailState ?? this.userDetailState);
  }
}
