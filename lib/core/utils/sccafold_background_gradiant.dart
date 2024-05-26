import 'package:flutter/material.dart';

import '../../constant.dart';

BoxDecoration containerGradiant() {
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
