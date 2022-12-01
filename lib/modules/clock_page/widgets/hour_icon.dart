import 'package:flutter/material.dart';
import 'dart:math';
import '../../../models/global_variables.dart';

class HourIcon extends StatelessWidget {
  const HourIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour.toDouble();
    final minute = DateTime.now().minute.toDouble();
    final second = DateTime.now().second.toDouble();
    final millisecond = DateTime.now().millisecond.toDouble();
    final angle = ((-pi * ((millisecond+(second*1000)+(minute*(1000*60))+(hour*(1000*60*60))) / -(1000*60*60*12))) * 2);
    final clockSize = MediaQuery.of(context).size.shortestSide;
    final clockSizeWithPadding = clockSize-(padding*2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0, (clockSizeWithPadding/3)-(insideCircleWidth/2)),
          child: Center(
            child: RotatedBox(quarterTurns:3,child: Icon(Icons.airplanemode_active,color:clockColor,size: clockSizeWithPadding/(hourIconScaleRatio))),
          ),
        ),
      ),
    );
  }
}