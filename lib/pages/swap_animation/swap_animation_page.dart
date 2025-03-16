import 'dart:math' as math;

import 'package:flutter/material.dart';

class SwapAnimationPage extends StatefulWidget {
  const SwapAnimationPage({super.key});

  @override
  State<SwapAnimationPage> createState() => _SwapAnimationPageState();
}

class _SwapAnimationPageState extends State<SwapAnimationPage>
    with TickerProviderStateMixin {
  late Map<int, AnimationController> animationController;
  late    Map<int, Animation<double>> animations;
  List<int> array = [30, 45];
  bool isInit = false;

  int index1 = 0;
  int index2 = 1;

  @override
  void initState() {
    if (!isInit) {
      final animationControllers = <int, AnimationController>{};
      for (int i = 0; i < array.length; i++) {
        // animationControllers[i] = Twe
      }

      animations = animationControllers;
    }
    isInit = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  int temp = index1;
                  index1 = index2;
                  index2 = index1;
                  for (final animation in animations.values) {
                    // animation.forward();
                  }
                },
                child: Text("start")),
            ElevatedButton(
                onPressed: () {
                  for (final animation in animations.values) {
                    // animation.animateBack(0);
                  }
                },
                child: Text("reset"))
          ],
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 800,
            height: 500,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final length = 2;
                final maxValue = 100;
                final unit = constraints.maxWidth / (length) - 24;
                final heightUnit = (constraints.maxHeight - 32) / maxValue;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: array.asMap().entries.map((entry) {
                    final index = entry.key;
                    final value = entry.value;
                    final animationValue = animations[index]?.value ??
                        index.toDouble();
                    var xOffSet = 0.0;
                    if(index == index1 && index2 < index1){
                      xOffSet = - index2 * unit;
                    } else if(index == index2 ){}
                    return AnimatedBuilder(
                        animation: animations[index]!,
                        builder: (context, child) {
                          return Opacity(
                            opacity: math.min(1.0, animations[index]!.value + 0.2),
                            child: Transform.translate(
                              offset: Offset(animations[index]!.value * xOffSet, 0),
                              child: Container(
                                width: unit,
                                height: heightUnit * value,
                                color: Colors.red,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('${array[index]}'),
                              ),
                            ),
                          );
                        });
                  }).toList(),
                );
              },
            ),
          ),
        ));
  }
}
