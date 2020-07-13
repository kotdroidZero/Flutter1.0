import 'package:flutter/foundation.dart';

class AppState {
  double sliderFontSize;
  bool bold;
  bool italic;

  AppState(@required this.sliderFontSize, this.bold, this.italic);

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  double get appFontSize => sliderFontSize * 30;
}
