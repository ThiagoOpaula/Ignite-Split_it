import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppGradients {
  Gradient get background;
}

class AppGradientsDefault implements AppGradients {
  @override
  // TODO: implement background
  Gradient get background => LinearGradient(colors: [
        Color(0XFF40B38C),
        Color(0XFF45CC93),
      ], transform: GradientRotation(2.35619 * pi));
}
