import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'app_settings_hive.g.dart';

@HiveType(typeId: 1)
class AppSettingsHive extends HiveObject{
  @HiveField(0)
  late int clockColor;
  @HiveField(1)
  late int appBackgroundColor;
  @HiveField(2)
  late bool useRadarForSecondHand;
  @HiveField(3)
  late String dateFormat;
}