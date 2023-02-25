import 'package:flutter/material.dart';

extension WidgetPadding on int {
  SizedBox get tall {
    return SizedBox(height: toDouble());
  }

  SizedBox get wide {
    return SizedBox(width: toDouble());
  }
}

extension CtxUtils on BuildContext {
  TextTheme get txtTheme {
    return Theme.of(this).textTheme;
  }

  Size get screenSize {
    return MediaQuery.of(this).size;
  }
}
