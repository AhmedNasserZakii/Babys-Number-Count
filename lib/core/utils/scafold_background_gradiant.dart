import 'package:flutter/material.dart';

import '../../constant.dart';

BoxDecoration scaffoldBackGroundGradiant() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        kMediumBlue,
        kLightMediumBlue,
        kLightBlue,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
