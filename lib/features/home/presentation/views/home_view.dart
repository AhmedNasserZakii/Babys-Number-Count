import 'package:flutter/material.dart';
import 'package:numbers_count/core/utils/scafold_background_gradiant.dart';
import 'package:numbers_count/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: scaffoldBackGroundGradiant(),
        child: const HomeViewBody(),
      ),
    );
  }
}
