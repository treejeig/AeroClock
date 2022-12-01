import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/global_variables.dart';

class MinuteIcon extends StatelessWidget {
  const MinuteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minute = DateTime.now().minute.toDouble();
    final second = DateTime.now().second.toDouble();
    final millisecond = DateTime.now().millisecond.toDouble();
    final angle = ((-pi * ((millisecond+(second*1000)+(minute*(1000*60))) / -(1000*60*60))) * 2);
    final clockSize = MediaQuery.of(context).size.shortestSide;
    final clockSizeWithPadding = clockSize-(padding*2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0, (5*clockSizeWithPadding/12)-(insideCircleWidth/2)),
          child: Center(
            child: RotatedBox(quarterTurns:3,child: Icon(Icons.airplanemode_active,color:clockColor,size: clockSizeWithPadding/(minuteIconScaleRatio))),
          ),
        ),
      ),
    );
  }
}