import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi_watch/common/constants/layout_constants.dart';
import 'package:mandi_watch/common/constants/png_constants.dart';
import 'package:mandi_watch/presentation/app/routes/app_routes.dart';
import 'package:mandi_watch/presentation/theme/color_theme/custom_color_theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      GoRouter.of(context).go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.launchBg,
      body: Center(
        child: Image.asset(
          PngConstants.appLogo,
          width: LayoutConstants.dimen_112,
          height: LayoutConstants.dimen_112,
        ),
      ),
    );
  }
}
