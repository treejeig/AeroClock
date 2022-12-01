import 'package:aeroclock/modules/clock_page/widgets/clock_background/widgets/clock_bg_circle.dart';
import 'package:aeroclock/modules/clock_page/widgets/clock_background/widgets/clock_bg_line.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../models/global_variables.dart';

class ClockBackground extends StatelessWidget {
  const ClockBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clockSize = MediaQuery.of(context).size.shortestSide;
    final clockSizeWithPadding = clockSize-(padding*2);
    return Container(
      width: clockSize,
      height: clockSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //circle - 1
          clockBGCircle(circleDiameter: clockSizeWithPadding,lineWidth: outsideCircleWidth),
          //circle - 2
          clockBGCircle(circleDiameter: clockSizeWithPadding*5/6,lineWidth: insideCircleWidth),
          //circle - 3
          clockBGCircle(circleDiameter: clockSizeWithPadding*2/3,lineWidth: insideCircleWidth),
          //circle - 4
          clockBGCircle(circleDiameter: clockSizeWithPadding/2,lineWidth: insideCircleWidth),

          //line 1-7
          clockBGLine(angle: -pi/3, clockLineLong: clockSizeWithPadding),
          //line 2-8
          clockBGLine(angle: -pi/6, clockLineLong: clockSizeWithPadding),
          //line 3-9
          clockBGLine(angle: pi, clockLineLong: clockSizeWithPadding),
          //line 4-10
          clockBGLine(angle: pi/6, clockLineLong: clockSizeWithPadding),
          //line 5-11
          clockBGLine(angle: pi/3, clockLineLong: clockSizeWithPadding),
          //line 6-12
          clockBGLine(angle: pi/2, clockLineLong: clockSizeWithPadding),
        ],
      ),
    );
  }
}