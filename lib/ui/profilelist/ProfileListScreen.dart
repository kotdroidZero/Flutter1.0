import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/data/model/Person.dart';

/// this is for understanding of loading json data from assets and build them in list view or whatever kind of data it is
/// on that kind of widget
class ProfileListScreen extends StatefulWidget {
  @override
  _ProfileListScreenState createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  List<Person> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// aligns toolbar title into center
        centerTitle: true,
        title: Text(
          'Developers',
        ),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('localjson/person.json'),
            builder: (context, snapshot) {
              JsonCodec codec = new JsonCodec();

              /// decode json
              var myDevs = codec.decode(snapshot.data.toString());

              return new ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: new Card(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name: ${myDevs[position]["name"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              Text("Age: ${myDevs[position]["age"]}"),
                              Text("Profile: ${myDevs[position]["profile"]}"),
                              Text("Manager: ${myDevs[position]["manager"]}")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: myDevs == null ? 0 : myDevs.length);
            },
          ),
        ),
      ),
    );
  }
}
