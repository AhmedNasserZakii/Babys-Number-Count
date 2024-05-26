import 'package:flutter/material.dart';

import 'package:numbers_count/features/splash/presentaion/views/widgets/splash_view_body.dart';

import '../../../../core/utils/sccafold_background_gradiant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: containerGradiant(),
        child: const SplashViewBody(),
      ),
    );
  }
}
