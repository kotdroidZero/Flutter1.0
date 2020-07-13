import 'package:helloworld/task4/stmredux/AppState.dart';
import 'package:helloworld/task4/stmredux/redux/actoin.dart';

/// what reducers do is, they take Previous state and action and based on that
/// action they perform some operations on current state, results in new state
/// and that new state is being returned...final
/// So basically reducers update the state which in-turns update the UI
/// so let's make some reducers

AppState reducers(AppState previousState, dynamic action) {
  AppState newState = AppState.fromAppState(previousState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payLoad;
  } else if (action is Bold) {
    newState.bold = action.payLoad;
  } else if (action is Italic) {
    newState.italic = action.payLoad;
  }
  return newState;
}
