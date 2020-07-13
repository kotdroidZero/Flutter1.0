import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helloworld/task4/stmreduxmiddlware/AppState.dart';
import 'package:helloworld/task4/stmreduxmiddlware/model/UsersDetail.dart';

class UserDetailListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.userDetailState.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return CircularProgressIndicator();
              } else
                return SizedBox.shrink();
            },
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.userDetailState.isError,
            builder: (context, isError) {
              if (isError) {
                return Text("Failed to get user list");
              } else
                return SizedBox.shrink();
            },
          ),
          Expanded(
            child: StoreConnector<AppState, List<UsersDetail>>(
                distinct: true,
                converter: (store) => store.state.userDetailState.userList,
                builder: (context, userList) {
                  if (userList.length != 0) {
                    return ListView.builder(
                      itemCount: userList.length == null ? 0 : userList.length,
                      itemBuilder: (BuildContext context, int position) {
                        return _getUserRow(context, userList[position]);
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget _getUserRow(BuildContext context, UsersDetail user) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Card(
            clipBehavior: Clip.antiAlias,
            borderOnForeground: true,
            margin: EdgeInsets.fromLTRB(8, 1, 8.0, 1),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160.0,
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Personal Detail', style: _getBoldTextStyle()),
                          Text(
                            user.name,
                            style: _getNormalTextStyle(),
                          ),
                          Text(
                            user.phone,
                            style: _getNormalTextStyle(),
                          ),
                          Text(
                            user.email,
                            style: _getNormalTextStyle(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                            child: Text(
                              user.address.getFullAddress(),
                              style: _getNormalTextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160.0,
                      color: Colors.teal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Company Detail', style: _getBoldTextStyle()),
                          Text(
                            "Company : ${user.company.name}",
                            style: _getNormalTextStyle(),
                          ),
                          Text(
                            "username : ${user.username}",
                            style: _getNormalTextStyle(),
                          ),
                          Text(
                            "website : ${user.website}",
                            style: _getNormalTextStyle(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                            child: Text(
                              "id : ${user.id}",
                              style: _getNormalTextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                    child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/200")))
              ],
            )));
  }

  TextStyle _getBoldTextStyle() => TextStyle(
      fontFamily: "Raleway",
      fontSize: 18.0,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700);

  TextStyle _getNormalTextStyle() => TextStyle(fontFamily: "Raleway");
}
