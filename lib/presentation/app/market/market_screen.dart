import 'package:flutter/material.dart';
import 'package:mandi_watch/data/models/mandi_data.dart';
import 'package:mandi_watch/presentation/app/market/market_constants.dart';
import 'package:mandi_watch/presentation/theme/color_theme/custom_color_theme.dart';
import 'package:mandi_watch/presentation/theme/text_theme/custom_text_theme.dart';
import 'package:mandi_watch/presentation/widget/custom_app_bar.dart';
import 'package:mandi_watch/presentation/widget/primary_container.dart';
import 'package:mandi_watch/presentation/widget/spacers.dart';

class MarketArgs {
  final List<Records>? records;
  final String? state;

  const MarketArgs(this.records, this.state);
}

class MarketScreen extends StatefulWidget {
  final MarketArgs args;
  const MarketScreen({
    super.key,
    required this.args,
  });

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.launchBg,
      appBar: CustomAppBar(
        title: widget.args.state,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RVSpacer(),
            PrimaryContainer(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      MarketConstants.title,
                      style: Theme.of(context)
                          .extension<CustomTextTheme>()!
                          .bodyLb,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
