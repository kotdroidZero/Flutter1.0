import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helloworld/task4/stmredux/AppState.dart';
import 'package:helloworld/task4/stmredux/redux/actoin.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Container(
          child: Column(
            children: <Widget>[
              Text("Font Size : ${state.appFontSize.toInt()}"),
              Slider(
                min: 0,
                max: 1,
                value: state.sliderFontSize,
                onChanged: (newValue) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(FontSize(newValue));
                },
                label: "Font Size",
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.bold,
                      onChanged: (checked) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(Bold(checked));
                      },
                    ),
                    Text("Bold", style: getStyle(state.bold, false))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.italic,
                      onChanged: (checked) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(Italic(checked));
                      },
                    ),
                    Text("Italic", style: getStyle(false, state.italic))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
