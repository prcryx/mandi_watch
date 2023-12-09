import 'package:flutter/material.dart';
import 'package:mandi_watch/common/constants/layout_constants.dart';
import 'package:mandi_watch/presentation/theme/color_theme/custom_color_theme.dart';

class PrimaryProgressIndicator extends StatelessWidget {
  const PrimaryProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: LayoutConstants.dimen_156,
      height: LayoutConstants.dimen_156,
      child: Transform.scale(
        scale: 0.5,
        child: CircularProgressIndicator(
          color: Theme.of(context).extension<CustomColorTheme>()!.primaryColor,
          strokeWidth: 10.0,
        ),
      ),
    );
  }
}
