import 'package:flutter/widgets.dart';

abstract class OwnThemeBorder {
  OwnThemeBorder({
    required this.style,
    required this.width,
    required this.radius,
  });

  OwnThemeBorderStyle style;
  OwnThemeBorderWidth width;
  OwnThemeBorderRadius radius;
}

abstract class OwnThemeBorderStyle {
  OwnThemeBorderStyle({
    required this.styleDefault,
  });

  BorderStyle styleDefault;
}

abstract class OwnThemeBorderWidth {
  OwnThemeBorderWidth({
    required this.widthDefault,
    required this.thin,
    required this.thick,
    required this.thicker,
  });

  double widthDefault;
  double thin;
  double thick;
  double thicker;
}

abstract class OwnThemeBorderRadius {
  OwnThemeBorderRadius({
    required this.radiusDefault,
    required this.small,
    required this.medium,
    required this.large,
    required this.pill,
    required this.circular,
  });

  double radiusDefault;
  double small;
  double medium;
  double large;
  double pill;
  double circular;
}
