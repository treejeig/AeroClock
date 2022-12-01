import 'package:flutter/material.dart';
import '../../../../../models/global_variables.dart';

Widget clockBGLine({required double angle,required clockLineLong}) {
  return Transform.rotate(
    angle: angle,
    child: Container(
      height: clockLineThickness,
      width: clockLineLong,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: clockColor.withAlpha(125),width: clockLineWidth)
      ),
    ),
  );
}