import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:numbers_count/core/utils/assets.dart';
import 'package:numbers_count/features/home/presentation/views/home_view.dart';
import 'package:rive/rive.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerStart;

  bool showButton = false;
  @override
  void initState() {
    super.initState();
    controllerStart = SimpleAnimation('start');

    rootBundle.load(AssetsData.startAnimation).then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      artboard.addController(controllerStart);
      setState(() {
        riveArtboard = artboard;
      });
    });
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          showButton = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: riveArtboard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveArtboard!,
                  fit: BoxFit.cover,
                ),
        ),
        showButton
            ? CustomElevatedButton(
                title: 'Let\' Count',
                onTap: () {
                  Get.to(() => const HomeView(), transition: Transition.fadeIn);
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
