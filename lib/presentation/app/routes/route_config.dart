import 'package:go_router/go_router.dart';
import 'package:mandi_watch/presentation/app/home/home_screen.dart';
import 'package:mandi_watch/presentation/app/launch/splash.dart';
import 'package:mandi_watch/presentation/app/market/market_screen.dart';
import 'package:mandi_watch/presentation/app/routes/route_constants.dart';

import 'app_routes.dart';

class RoutesConfig {
  static get router => GoRouter(
        initialLocation: AppRoutes.initialRoute,
        routes: [
          GoRoute(
            name: RouteConstants.splash,
            path: AppRoutes.initialRoute,
            builder: (context, state) => const Splash(),
          ),
          GoRoute(
            name: RouteConstants.home,
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            name: RouteConstants.market,
            path: AppRoutes.market,
            builder: (context, state) {
              MarketArgs args = state.extra as MarketArgs;
              return MarketScreen(args: args);
            },
          ),
        ],
      );
}
