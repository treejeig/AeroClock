import 'package:aeroclock/models/global_variables.dart';
import 'package:aeroclock/models/hive/app_settings_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_strategy/url_strategy.dart';
import 'modules/clock_page/clock_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Hive.initFlutter();
  Hive.registerAdapter<AppSettingsHive>(AppSettingsHiveAdapter());
  appSettingsHiveBox = await Hive.openBox("appSettingsHiveBox");
  clockColor = Color(appSettingsHiveBox.get("clockColor",defaultValue: Colors.red.value));
  appBackgroundColor = Color(appSettingsHiveBox.get("appBackgroundColor",defaultValue: Colors.black.value));
  useRadarForSecondHand = appSettingsHiveBox.get("useRadarForSecondHand",defaultValue: true);
  dateFormat = appSettingsHiveBox.get("dateFormat",defaultValue: "dd-MM-yyyy");
  runApp(ProviderScope(child: AeroClock()));
}

class AeroClock extends StatelessWidget {
  const AeroClock({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AeroClock',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ClockPage()
    );
  }
}
