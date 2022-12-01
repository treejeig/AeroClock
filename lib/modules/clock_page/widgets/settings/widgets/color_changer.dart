import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../models/global_variables.dart';
import '../settings_popup_controller.dart';

Widget ColorChanger({required WidgetRef ref}) {
  final SettingsPopupController settingsPopupController = ref.watch(settingsPopupProvider);
  return Container(
      padding: EdgeInsets.only(top: padding/2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    settingsPopupController.changeIsClockColor(true);
                  },
                  child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        color: settingsPopupController.isClockColor ? appBackgroundColor.withAlpha(100) : appBackgroundColor.withAlpha(50),
                        border: Border.all(color: settingsPopupController.isClockColor ? clockColor : clockColor.withAlpha(150),width: 2),
                        borderRadius: BorderRadius.circular(padding)
                      ),
                      child: Text("Clock",style: TextStyle(color: clockColor))
                  )
              ),
              GestureDetector(
                  onTap: (){
                    settingsPopupController.changeIsClockColor(false);
                  },
                  child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          color: !settingsPopupController.isClockColor ? appBackgroundColor.withAlpha(100) : appBackgroundColor.withAlpha(50),
                          border: Border.all(color: !settingsPopupController.isClockColor ? clockColor : clockColor.withAlpha(150),width: 2),
                          borderRadius: BorderRadius.circular(padding)
                      ),
                      child: Text("Background",style: TextStyle(color: clockColor))
                  )
              ),
            ],
          ),
          Divider(color: settingsPopupController.isClockColor ? clockColor : appBackgroundColor,thickness: 2,),
          ColorPicker(
            pickerColor: settingsPopupController.isClockColor ? clockColor : appBackgroundColor,
            enableAlpha: false,
            labelTypes: [],
            displayThumbColor: true,
            onColorChanged: settingsPopupController.isClockColor ? settingsPopupController.changeClockColor : settingsPopupController.changeAppBackgroundColor,
          ),
        ],
      ),
    );
}