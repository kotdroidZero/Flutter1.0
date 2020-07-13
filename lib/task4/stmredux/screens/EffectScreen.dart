import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helloworld/task4/stmredux/AppState.dart';

class EffectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "The slider widget itself does not maintain any state. "
              "Instead, when the state of the slider changes, the widget calls"
              " the onChanged callback. Most widgets that use a slider will "
              "listen for the onChanged callback and rebuild the slider with a "
              "new value to update the visual appearance of the slider. "
              "To know when the value starts to change, or when it is done "
              "changing, set the optional callbacks onChangeStart and/or"
              " onChangeEnd. The slider widget itself does not maintain any state. "
              "Instead, when the state of the slider changes, the widget calls"
              " the onChanged callback. Most widgets that use a slider will "
              "listen for the onChanged callback and rebuild the slider with a "
              "new value to update the visual appearance of the slider. "
              "To know when the value starts to change, or when it is done "
              "changing,",
              style: getStyle(state.appFontSize,state.bold, state.italic),
            ),
          );
        });
  }

  TextStyle getStyle([double fontSize,bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
