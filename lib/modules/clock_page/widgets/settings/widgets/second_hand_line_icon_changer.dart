import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../models/global_variables.dart';
import '../settings_popup_controller.dart';

Widget SecondHandLineIconChanger({required WidgetRef ref}) {
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
                child: Text("Second Hand Settings",style: TextStyle(color: clockColor))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap : (){
                    settingsPopupController.changeUseRadarForSecondHand(true);
                  },
                  child: Container(
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      color: useRadarForSecondHand ? appBackgroundColor.withAlpha(100) : appBackgroundColor.withAlpha(50),
                        border: Border.all(color: useRadarForSecondHand ? clockColor : clockColor.withAlpha(150),width: 2),
                      borderRadius: BorderRadius.circular(padding)
                    ),
                    child: Icon(Icons.radar,color: useRadarForSecondHand ? clockColor : clockColor.withAlpha(150)),
                  ),
                ),
                GestureDetector(
                  onTap : (){
                    settingsPopupController.changeUseRadarForSecondHand(false);
                  },
                  child: Container(
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                        color: useRadarForSecondHand ? appBackgroundColor.withAlpha(50) : appBackgroundColor.withAlpha(100),
                        border: Border.all(color: useRadarForSecondHand ? clockColor.withAlpha(150) : clockColor,width: 2),
                        borderRadius: BorderRadius.circular(padding)
                    ),
                    child: Icon(Icons.airplanemode_active,color: useRadarForSecondHand ? clockColor.withAlpha(150) : clockColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}