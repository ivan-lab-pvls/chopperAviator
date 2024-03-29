import 'package:auto_route/auto_route.dart';
import 'package:chopper_crew_app/models/puzzle_model.dart';
import 'package:chopper_crew_app/screens/chopper_dash/chopper_dash_game/chopper_dash_game_screen.dart';
import 'package:chopper_crew_app/screens/chopper_dash/chopper_dash_list/chopper_dash_list_screen.dart';
import 'package:chopper_crew_app/screens/chopper_dash/enter_coins/enter_coins_screen.dart';
import 'package:chopper_crew_app/screens/chopper_dash/result/result_screen.dart';
import 'package:chopper_crew_app/screens/main/main_screen.dart';
import 'package:chopper_crew_app/screens/news/news_info/news_info_screen.dart';
import 'package:chopper_crew_app/screens/news/news_list/news_list_screen.dart';
import 'package:chopper_crew_app/screens/onboarding/onboarding_screen.dart';
import 'package:chopper_crew_app/screens/puzzle/puzzle_game/puzzle_game_screen.dart';
import 'package:chopper_crew_app/screens/puzzle/puzzle_list/puzzle_list_screen.dart';
import 'package:chopper_crew_app/screens/settings/settings_screen.dart';
import 'package:chopper_crew_app/models/news_model.dart';
import 'package:chopper_crew_app/models/chopper_model.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: NewsListRoute.page),
        AutoRoute(page: NewsInfoRoute.page),
        AutoRoute(page: PuzzleListRoute.page),
        AutoRoute(page: PuzzleGameRoute.page),
        AutoRoute(page: ChopperDashListRoute.page),
        AutoRoute(page: EnterCoinsRoute.page),
        AutoRoute(page: ChopperDashGameRoute.page),
        AutoRoute(page: ResultRoute.page),
      ];
}
