import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helloworld/data/model/PlanetModel.dart';
import 'package:helloworld/utils/Constants.dart';
import 'package:helloworld/utils/routegenerator/RouteGenerator.dart';

/// here our main agenda is to learn about dialogs and listView,
/// so basically we have 3 types of dialog
/// 1. Alert Dialog
/// 2. Custom Dialog
/// 3. Full Screen Dialog
/// We will be dealing with each , one by one
class PlanetWeightScreen extends StatefulWidget {
  @override
  _PlanetWeightScreenState createState() => _PlanetWeightScreenState();
}

class _PlanetWeightScreenState extends State<PlanetWeightScreen> {
  //region Variables
  PlanetModel _planetModel;

  double sliderValue = 2.0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<PlanetModel> planetModelList = List<PlanetModel>();

  /// TextFiled controller to get the text value at any point of time from the text-filed
  TextEditingController weightEditController = new TextEditingController();

  //endregion

  //region Dialogs
  /// Alert Dialog
  void _openAlertDialog() {
    showDialog(
        context: context,
        // this variable will disable cancel outside dialog touch if sets to false
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert Dialog!'),
            content: Text('This is simple alert Dialog for learning purpose'),
          );
        });
  }

  /// full screen dialog
  void _fullScreenDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.teal,
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 20,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }

  /// custom dialog
  void _openCustomDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Fill the form below'),
            content: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: weightEditController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(labelText: "Enter Weight"),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Select a planet'),
                    SizedBox(
                      height: 10.0,
                    ),
                    RadioGroup(
                      callback: (val) {
                        setState(() => _planetModel = val);
                      },
                    )
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.done),
                tooltip: "Done",
                onPressed: () {
                  /// todo here need to write logic for adding the data into recyclerview of MainScreen
                  if (weightEditController.text.isEmpty) {
                    //showSnackBar(context, "Please enter a weight", "OK");
                    Fluttertoast.showToast(msg: "Please enter a weight");
                    return;
                  } else if (_planetModel == null) {
                    Fluttertoast.showToast(
                        msg: "Please choose any planet to move further");
                    return;
                  } else {
                    Navigator.of(context).pop();
                    _addItemToPlanetList();
                    Fluttertoast.showToast(
                        msg: _planetModel.name + _planetModel.index.toString());
                  }
                },
              )
            ],
          );
        });
  }

  //endregion

  //region LifeCycle Method
  @override
  void dispose() {
    weightEditController.dispose();
    super.dispose();
  }

  //endregion

  //region Custom Methods
  /// will be set when any model is being choosen from radio button
  set planetModel(PlanetModel model) {
    setState(() {
      _planetModel = model;
    });
  }

  /// method will be called, when fab is clicked
  void _addItemToPlanetList() {
    setState(() {
      _planetModel.weight = num.parse(weightEditController.text);
      weightEditController.text = "";
      planetModelList.insert(0, _planetModel);
    });
  }

  void showSnackBar(String message, String actionNme) {
    var snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionNme,
        onPressed: () {},
      ),
    );
    Scaffold.of(this.context).showSnackBar(snackBar);
  }

  /// Row List Item Widget (in android it was row_item that was inflated in Adapter class)
  Widget getRowItem(int position) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      color: Colors.teal,
      child: ListTile(
        onTap: () {
          RouteGenerator.navigate(context, Constants.ROUTE_MOVIE_LIST,
              planetModelList[position].name);
          //showSnackBar("Item number $position tapped", "OK");
        },
        leading: Icon(Icons.landscape),
        trailing: Icon(Icons.wb_sunny),
        title: Text(
          planetModelList[position].name,
          style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          "Id: ${planetModelList[position].index} Weight: ${planetModelList[position].weight}",
          style: TextStyle(fontFamily: "Raleway"),
        ),
      ),
    );
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Planet Weight'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Slider(
            value: sliderValue.toDouble(),
            min: 0,
            activeColor: Colors.amber,
            max: 7,
            onChanged: (newValue) {
              setState(() {
                sliderValue = newValue;
              });
            },
            label: "Font Size",
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child:
                  Text("Tap on + icon and then tap Row Below to see api work")),
          Expanded(
            flex: 2,
            child: ListView.builder(
                itemCount: planetModelList.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowItem(position);
                }),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Add Weight",
        onPressed: () {
          _openCustomDialog();
        },
      ),
    );
  }
}

/// callback to send data from child widget to it's parent widget
typedef void RadioGroupCallback(PlanetModel planetModel);

class RadioGroup extends StatefulWidget {
  final RadioGroupCallback callback;

  RadioGroup({this.callback});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  //region Variables
  /// Default value for radio group button
  String radioItem = '';

  /// Group Value for Radio Button.
  int id = -1;

  /// create list of planets
  List<PlanetModel> planetList = [
    PlanetModel(name: 'Earth', index: 1),
    PlanetModel(name: 'Pluto', index: 2),
    PlanetModel(name: 'Mars', index: 3)
  ];

  //endregion

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: planetList
                .map((data) => RadioListTile(
                      title: Text(data.name),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;

                          /// passing data back to it's parent using callback
                          widget.callback(data);
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
