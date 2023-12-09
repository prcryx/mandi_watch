import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandi_watch/di/injector_config.dart';
import 'package:mandi_watch/presentation/theme/text_theme/app_text_theme.dart';

import 'common/constants/app_constants.dart';
import 'common/utils/scroll_behavior.dart';
import 'presentation/app/routes/route_config.dart';
import 'presentation/theme/color_theme/app_color_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  InjectorConfig.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return getApp();
      },
    );
  }

  MaterialApp getApp() {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          lightTheme,
          textTheme,
        ],
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: SafeArea(child: child!),
        );
      },
      themeMode: ThemeMode.light,
      routerConfig: RoutesConfig.router,
    );
  }
}
