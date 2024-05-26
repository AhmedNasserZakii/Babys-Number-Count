import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers_count/core/utils/assets.dart';
import 'package:numbers_count/core/utils/number_animation_enum.dart';
import 'package:rive/rive.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late RiveAnimationController controllerIdle;
  Artboard? riveArtboard;
  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(NumberAnimationEnum.One_idle.name);

    rootBundle.load(AssetsData.numbersAnimation).then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  void removeAllControllers() {
    if (riveArtboard == null) return;
    riveArtboard!.artboard.removeController(controllerIdle);
  }

  void addIdelController() {
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint('Idle');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      //width: 100,
      // child: riveArtboard == null
      //     ? const SizedBox.shrink()
      //     : Rive(
      //         artboard: riveArtboard!,
      //         fit: BoxFit.cover,
      //       ),
    );
  }
}
