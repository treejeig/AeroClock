import 'package:aeroclock/modules/clock_page/widgets/clock_background/clock_background.dart';
import 'package:aeroclock/modules/clock_page/widgets/settings/settings_popup_view.dart';
import 'package:aeroclock/modules/clock_page/widgets/digital_clock.dart';
import 'package:aeroclock/modules/clock_page/widgets/hour_icon.dart';
import 'package:aeroclock/modules/clock_page/widgets/minute_icon.dart';
import 'package:aeroclock/modules/clock_page/widgets/second_icon.dart';
import 'package:aeroclock/modules/clock_page/widgets/second_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/global_variables.dart';

class ClockPage extends ConsumerStatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends ConsumerState<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: Stream.periodic(Duration(milliseconds: 1)),
          builder: (context, snapshot) {
            return Container(
              color: appBackgroundColor,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClockBackground(),
                    HourIcon(),
                    MinuteIcon(),
                    useRadarForSecondHand ? SecondLine() : SecondIcon(),
                    DigitalClock(),
                    Positioned(
                        bottom: padding,
                        right: padding,
                        child: GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context){
                                  return Container(
                                    constraints: BoxConstraints(
                                      maxHeight: 500.0,
                                      maxWidth: 500.0,
                                      minHeight: 250.0,
                                      minWidth: 250.0,
                                    ),
                                    width: MediaQuery.of(context).size.shortestSide/2,
                                    height: MediaQuery.of(context).size.shortestSide/2,
                                    child: SettingsPopup(),
                                  );
                                });
                          },
                          child: Icon(Icons.settings, color: clockColor,size: 32),
                    ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
