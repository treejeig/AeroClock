import 'package:flutter/material.dart';
import 'dart:math';
import '../../../models/global_variables.dart';

class SecondLine extends StatelessWidget {
  const SecondLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final millisecond = DateTime.now().millisecond.toDouble();
    final second = DateTime.now().second.toDouble();
    final angle = ((-pi * ((millisecond+(second*1000)) / -(1000*60))) * 2);
    final clockSize = MediaQuery.of(context).size.shortestSide;
    final clockSizeWithPadding = clockSize-(padding*2);
    return RotatedBox(
      quarterTurns: 3,
      child: Transform.rotate(
        angle: angle-(pi/6),
        child: Container(
          width: clockSizeWithPadding,
          height: clockSizeWithPadding,
          child: CustomPaint(
            painter: Arc(),
          ),
        ),
      ),
    );
  }
}

class Arc extends CustomPainter {
  final double angle = 30;
  double doubleToAngle(double angle) => angle * pi / 180.0;

  void drawArcWithRadius(
      Canvas canvas, Offset center, double radius, double angle, Paint paint) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        doubleToAngle(0.0), doubleToAngle(angle), true, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);
    final double radius = size.width/2;

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = new SweepGradient(
          colors: [
            clockColor.withAlpha(25),
            clockColor.withAlpha(150),
          ],
          startAngle: 0.0,
          endAngle: doubleToAngle(angle),
          tileMode: TileMode.decal
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    drawArcWithRadius(canvas, center, radius, angle, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
