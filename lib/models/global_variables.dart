import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

late Box appSettingsHiveBox;
double padding = 16.0;
double insideCircleWidth = 2.0;
double outsideCircleWidth = 3.0;
double clockLineWidth = 2.0;
double clockLineThickness = 2.0;
double digitalClockTextScaleRatio = 8.0;
double digitalDateTextScaleRatio = 12.0;
double hourIconScaleRatio = 16.0;
double minuteIconScaleRatio = 12.0;
double secondIconScaleRatio = 10.0;
Color clockColor = Colors.red;
Color appBackgroundColor = Colors.black;
bool useRadarForSecondHand = true;
String dateFormat = "dd-MM-yyyy";