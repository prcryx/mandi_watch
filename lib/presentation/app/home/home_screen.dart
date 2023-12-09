import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi_watch/common/constants/layout_constants.dart';
import 'package:mandi_watch/data/models/mandi_data.dart';
import 'package:mandi_watch/di/injector.dart';
import 'package:mandi_watch/presentation/app/home/bloc/home_cubit.dart';
import 'package:mandi_watch/presentation/app/home/bloc/home_state.dart';
import 'package:mandi_watch/presentation/app/market/market_screen.dart';
import 'package:mandi_watch/presentation/app/routes/app_routes.dart';
import 'package:mandi_watch/presentation/app/routes/route_constants.dart';
import 'package:mandi_watch/presentation/theme/color_theme/custom_color_theme.dart';
import 'package:mandi_watch/presentation/theme/text_theme/custom_text_theme.dart';
import 'package:mandi_watch/presentation/widget/custom_app_bar.dart';
import 'package:mandi_watch/presentation/widget/primary_container.dart';
import 'package:mandi_watch/presentation/widget/primary_progress_indicator.dart';
import 'package:mandi_watch/presentation/widget/spacers.dart';
import 'package:mandi_watch/presentation/widget/state_card.dart';

import '../../../../../common/constants/png_constants.dart';
import 'home_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;

  List<Records>? records;
  List<String?>? uniqueStates;

  @override
  void initState() {
    cubit = Injector.resolver<HomeCubit>();
    cubit.getMandiData();
    super.initState();
  }

  void _onTap(String state, BuildContext context) {
    List<Records> _stateRecords = records.getRecordsByState(state);
    context.goNamed(RouteConstants.market,
        extra: MarketArgs(_stateRecords, state));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.launchBg,
      appBar: const CustomAppBar(
        title: HomeConstants.title,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<HomeCubit, HomeState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is MandiDataFetchSuccessState) {
              setState(() {
                records = state.res?.records;
                uniqueStates = records.uniqueStates;
              });
            }
          },
          builder: (context, state) {
            if (state is MandiDataFetchSuccessState) {
              return Column(
                children: [
                  const RVSpacer(),
                  _buildTitle(context),
                  const RVSpacer(),
                  Expanded(
                    child: PrimaryContainer(
                      child: GridView.builder(
                        itemCount: uniqueStates?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: LayoutConstants.dimen_16,
                          mainAxisSpacing: LayoutConstants.dimen_16,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () =>
                              _onTap(uniqueStates![index] ?? "", context),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Theme.of(context)
                                  .extension<CustomColorTheme>()!
                                  .primaryLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    LayoutConstants.dimen_16),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              uniqueStates![index] ?? "",
                              style: Theme.of(context)
                                  .extension<CustomTextTheme>()!
                                  .bodyLbOnPrimaryLight,
                            )),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(child: PrimaryProgressIndicator());
          }),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return PrimaryContainer(
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Filtered by States",
              style: Theme.of(context).extension<CustomTextTheme>()!.bodyLb,
            ),
          ),
        ],
      ),
    );
  }
}
