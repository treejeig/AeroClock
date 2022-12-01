import 'package:aeroclock/modules/clock_page/widgets/settings/settings_popup_controller.dart';
import 'package:aeroclock/modules/clock_page/widgets/settings/widgets/color_changer.dart';
import 'package:aeroclock/modules/clock_page/widgets/settings/widgets/date_format_changer.dart';
import 'package:aeroclock/modules/clock_page/widgets/settings/widgets/second_hand_line_icon_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/global_variables.dart';

class SettingsPopup extends ConsumerStatefulWidget {
  const SettingsPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPopup> createState() => _SettingsPopupState();
}

class _SettingsPopupState extends ConsumerState<SettingsPopup> {
  @override
  Widget build(BuildContext context) {
    final SettingsPopupController settingsPopupController = ref.watch(settingsPopupProvider);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(padding))
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(padding),topLeft: Radius.circular(padding)),
            color: appBackgroundColor,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Settings",style: TextStyle(color: clockColor)),
              ],
            ),
            Positioned(
              right: 0,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      },
                    child: Icon(Icons.close,color: clockColor)
                )
            )
          ],
        )
      ),
      backgroundColor: appBackgroundColor.withAlpha(125),
      contentPadding: EdgeInsets.symmetric(horizontal: padding),
      content: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ColorChanger(ref:ref),
                Divider(color: settingsPopupController.isClockColor ? clockColor : appBackgroundColor,thickness: 2,),
                SecondHandLineIconChanger(ref:ref),
                Divider(color: settingsPopupController.isClockColor ? clockColor : appBackgroundColor,thickness: 2,),
                DateFormatChanger(ref:ref),
                Divider(color: settingsPopupController.isClockColor ? clockColor : appBackgroundColor,thickness: 2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
