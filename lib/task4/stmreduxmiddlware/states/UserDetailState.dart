import 'package:helloworld/task4/stmreduxmiddlware/model/UsersDetail.dart';

class UserDetailState {
  //region Variables
  final bool isError;
  final bool isLoading;
  final List<UsersDetail> userList;

  //endregion

  //region Constructor
  UserDetailState({this.isError, this.isLoading, this.userList});

//endregion

  factory UserDetailState.initial() =>
      UserDetailState(isError: false, isLoading: false, userList: []);

  UserDetailState copyWith({
    bool isError,
    bool isLoading,
    List<UsersDetail> userList,
  }) {
    return UserDetailState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      userList: userList ?? this.userList,
    );
  }
}
