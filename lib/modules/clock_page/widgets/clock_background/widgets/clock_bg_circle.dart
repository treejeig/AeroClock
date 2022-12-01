import 'package:flutter/material.dart';
import '../../../../../models/global_variables.dart';

Widget clockBGCircle({required double circleDiameter,required lineWidth}) {
  return Container(
    height: circleDiameter,
    width: circleDiameter,
    decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: clockColor.withAlpha(125), width: lineWidth)),
  );
}