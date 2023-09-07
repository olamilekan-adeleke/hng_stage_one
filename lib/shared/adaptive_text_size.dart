import 'package:flutter/cupertino.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  static double adaptiveTextSize(BuildContext context, double value) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
