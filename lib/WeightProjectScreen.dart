import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeightProjectScreen extends StatefulWidget {
  @override
  _WeightProjectState createState() => _WeightProjectState();
}

class _WeightProjectState extends State<WeightProjectScreen> {
  String newWeight = "";
  num weight = 0;
  num newValue = 0;

  void update() {
    setState(() {
      if (newValue == 0) {
        Fluttertoast.showToast(msg: 'Please enter weight');
        return;
      }
      weight = weight + newValue;
      newWeight = weight.toString();
    });
  }

  void numChanged(String newValueCame) {
    setState(() {
      if (newValueCame.isNotEmpty)
        newValue = num.parse(newValueCame);
      else
        newValue = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight"),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Your updated weight value is:'),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(newWeight),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 56,
                child: TextField(
                  onChanged: (value) {
                    numChanged(value);
                  },
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Enter Weight"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    update();
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.black,
                  elevation: 8,
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
