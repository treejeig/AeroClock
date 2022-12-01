import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/global_variables.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTimeNow = DateTime.now();
    final String textFont = "LCD";
    final Color digitalClockBGTextColor = clockColor.withOpacity(0.1);
    final String textFont2 = "Patopian";
    final clockSize = MediaQuery.of(context).size.shortestSide;
    final clockSizeWithPadding = clockSize-(padding*2);
    final digitalClockFontSize = (clockSizeWithPadding/digitalClockTextScaleRatio)-1;
    final digitalDateFontSize = (clockSizeWithPadding/digitalDateTextScaleRatio)-1;
    return Container(
      width: clockSizeWithPadding/2,
      height: clockSizeWithPadding/2,
      decoration: BoxDecoration(
          color: appBackgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: clockColor.withAlpha(125),width: outsideCircleWidth)
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Text("88",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                    Text("${DateFormat("HH").format(dateTimeNow)}",style: TextStyle(color:clockColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                  ],
                ),
                Stack(
                  children: [
                    Text(":",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                    Text(":",style: TextStyle(color:dateTimeNow.millisecond<500 ? clockColor : Colors.transparent,fontFamily: textFont,fontSize: digitalClockFontSize)),
                  ],
                ),
                Stack(
                  children: [
                    Text("88",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                    Text("${DateFormat("mm").format(dateTimeNow)}",style: TextStyle(color:clockColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                  ],
                ),
                Stack(
                  children: [
                    Text(":",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                    Text(":",style: TextStyle(color:dateTimeNow.millisecond<500 ? clockColor : Colors.transparent,fontFamily: textFont,fontSize: digitalClockFontSize)),
                  ],
                ),
                Stack(
                  children: [
                    Text("88",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                    Text("${DateFormat("ss").format(dateTimeNow)}",style: TextStyle(color:clockColor,fontFamily: textFont,fontSize: digitalClockFontSize)),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Text("88-88-8888",style: TextStyle(color:digitalClockBGTextColor,fontFamily: textFont,fontSize: digitalDateFontSize)),
                Text("${DateFormat(dateFormat).format(DateTime.now())}",style: TextStyle(color:clockColor,fontFamily: textFont,fontSize: digitalDateFontSize)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}