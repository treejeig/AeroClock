import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../models/global_variables.dart';
import '../settings_popup_controller.dart';

Widget DateFormatChanger({required WidgetRef ref}) {
  final SettingsPopupController settingsPopupController = ref.watch(settingsPopupProvider);
  return Container(
    padding: EdgeInsets.only(bottom: padding/2),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: padding/2),
              child: Text("Date Format Settings",style: TextStyle(color: clockColor))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              dateFormatChangerItem("dd-MM-yyyy",settingsPopupController),
              dateFormatChangerItem("MM-dd-yyyy",settingsPopupController)
            ],
          ),
        ],
      ),
    ),
  );
}

Widget dateFormatChangerItem(String newDateFormat, SettingsPopupController settingsPopupController) {
  return GestureDetector(
    onTap : (){
    settingsPopupController.changeDateFormat(newDateFormat);
    },
    child: Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: dateFormat == newDateFormat ? appBackgroundColor.withAlpha(100) : appBackgroundColor.withAlpha(50),
          border: Border.all(color: dateFormat == newDateFormat ? clockColor : clockColor.withAlpha(150),width: 2),
          borderRadius: BorderRadius.circular(padding)
      ),
      child: Text(newDateFormat,style: TextStyle(color: clockColor)),
    ),
  );
}