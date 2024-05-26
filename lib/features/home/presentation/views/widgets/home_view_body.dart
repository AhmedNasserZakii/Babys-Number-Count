import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers_count/core/utils/assets.dart';
import 'package:numbers_count/core/utils/number_animation_enum.dart';
import 'package:numbers_count/core/widgets/custom_elevated_button.dart';
import 'package:rive/rive.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerOneIdle;
  late RiveAnimationController controllerOneToTwo;
  late RiveAnimationController controllerTwoToThree;
  late RiveAnimationController controllerThreeToFour;
  late RiveAnimationController controllerFourToFive;
  late RiveAnimationController controllerFiveToSix;
  late RiveAnimationController controllerSixToSeven;
  late RiveAnimationController controllerSevenToEight;
  late RiveAnimationController controllerEightToNine;
  late RiveAnimationController controllerNineToTen;
  late RiveAnimationController controllerTenToOne;
  @override
  void initState() {
    super.initState();
    controllerOneIdle = SimpleAnimation(NumberAnimationEnum.One_idle.name);
    controllerOneToTwo = SimpleAnimation(NumberAnimationEnum.One_Two.name);
    controllerTwoToThree = SimpleAnimation(NumberAnimationEnum.Two_Three.name);
    controllerThreeToFour =
        SimpleAnimation(NumberAnimationEnum.Three_Four.name);
    controllerFourToFive = SimpleAnimation(NumberAnimationEnum.Four_Five.name);
    controllerFiveToSix = SimpleAnimation(NumberAnimationEnum.Five_Six.name);
    controllerSixToSeven = SimpleAnimation(NumberAnimationEnum.Six_Seven.name);
    controllerSevenToEight =
        SimpleAnimation(NumberAnimationEnum.Seven_Eight.name);
    controllerEightToNine =
        SimpleAnimation(NumberAnimationEnum.Eight_Nine.name);
    controllerNineToTen = SimpleAnimation(NumberAnimationEnum.Nine_Ten.name);
    controllerTenToOne = SimpleAnimation(NumberAnimationEnum.Ten_One.name);

    rootBundle.load(AssetsData.numbersAnimation).then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerOneIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  void removeAllControllers() {
    if (riveArtboard == null) return;
    riveArtboard!.artboard.removeController(controllerOneIdle);
    riveArtboard!.artboard.removeController(controllerOneToTwo);
    riveArtboard!.artboard.removeController(controllerTwoToThree);
    riveArtboard!.artboard.removeController(controllerThreeToFour);
    riveArtboard!.artboard.removeController(controllerFourToFive);
    riveArtboard!.artboard.removeController(controllerFiveToSix);
    riveArtboard!.artboard.removeController(controllerSixToSeven);
    riveArtboard!.artboard.removeController(controllerSevenToEight);
    riveArtboard!.artboard.removeController(controllerEightToNine);
    riveArtboard!.artboard.removeController(controllerNineToTen);
    riveArtboard!.artboard.removeController(controllerTenToOne);

    debugPrint('Remove All Controllers');
  }

  void addOneIdelController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerOneIdle);
    debugPrint('One Idle');
  }

  void addOneToTwoController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerOneToTwo);
    debugPrint('One To Two');
  }

  void addTwoToThreeController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerTwoToThree);
    debugPrint('Two To Three');
  }

  void addThreeToFourController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerThreeToFour);
    debugPrint('Three to Four');
  }

  void addFourToFiveController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFourToFive);
    debugPrint('Four To Five');
  }

  void addFiveToSixController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFiveToSix);
    debugPrint('Five To Six');
  }

  void addSixToSevenController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSixToSeven);
    debugPrint('Six To Seven');
  }

  void addSevenToEightController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSevenToEight);
    debugPrint('Seven TO Eight');
  }

  void addEightToNineController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerEightToNine);
    debugPrint('Eight To Nine');
  }

  void addNineToTenController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerNineToTen);
    debugPrint('Nine To Ten');
  }

  int counter = 2;
  @override
  Widget build(BuildContext context) {
    final List<VoidCallback> controllers = [
      addOneIdelController,
      addOneToTwoController,
      addTwoToThreeController,
      addThreeToFourController,
      addFourToFiveController,
      addFiveToSixController,
      addSixToSevenController,
      addSevenToEightController,
      addEightToNineController,
      addNineToTenController,
    ];
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          width: double.infinity,
          child: riveArtboard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveArtboard!,
                  fit: BoxFit.cover,
                ),
        ),
        CustomElevatedButton(
          onTap: () {
            setState(() {
              if (counter == 1) {
                addOneIdelController();
                counter++;
              } else if (counter == 2) {
                addOneToTwoController();
                counter++;
              } else if (counter == 3) {
                addTwoToThreeController();
                counter++;
              } else if (counter == 4) {
                addThreeToFourController();
                counter++;
              } else if (counter == 5) {
                addFourToFiveController();
                counter++;
              } else if (counter == 6) {
                addFiveToSixController();
                counter++;
              } else if (counter == 7) {
                addSixToSevenController();
                counter++;
              } else if (counter == 8) {
                addSevenToEightController();

                counter++;
              } else if (counter == 9) {
                addEightToNineController();
                counter++;
              } else if (counter == 10) {
                addNineToTenController();
                counter++;
              } else {
                counter = 2;
              }
            });
          },
          title: counter == 11 ? 'Again' : 'Next',
        ),
      ],
    );
  }
}
