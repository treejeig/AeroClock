import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/global_variables.dart';

final settingsPopupProvider = ChangeNotifierProvider<SettingsPopupController>((ref){
  return SettingsPopupController();
});

class SettingsPopupController extends ChangeNotifier {

  bool isClockColor = true;

  changeIsClockColor(bool value){
    isClockColor = value;
    notifyListeners();
  }

  changeClockColor(Color color){
    clockColor = color;
    appSettingsHiveBox.put("clockColor",clockColor.value);
    notifyListeners();
  }

  changeAppBackgroundColor(Color color){
    appBackgroundColor = color;
    appSettingsHiveBox.put("appBackgroundColor",appBackgroundColor.value);
    notifyListeners();
  }

  changeUseRadarForSecondHand(bool value){
    useRadarForSecondHand = value;
    appSettingsHiveBox.put("useRadarForSecondHand",useRadarForSecondHand);
    notifyListeners();
  }

  changeDateFormat(String newDateFormat){
    dateFormat = newDateFormat;
    appSettingsHiveBox.put("dateFormat",dateFormat);
    notifyListeners();
  }
}