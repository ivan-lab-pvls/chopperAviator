// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChopperDashGameRoute.name: (routeData) {
      final args = routeData.argsAs<ChopperDashGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChopperDashGameScreen(
          key: args.key,
          chopper: args.chopper,
          coins: args.coins,
        ),
      );
    },
    ChopperDashListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChopperDashListScreen(),
      );
    },
    EnterCoinsRoute.name: (routeData) {
      final args = routeData.argsAs<EnterCoinsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EnterCoinsScreen(
          key: args.key,
          chopper: args.chopper,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PuzzleGameRoute.name: (routeData) {
      final args = routeData.argsAs<PuzzleGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PuzzleGameScreen(
          key: args.key,
          puzzle: args.puzzle,
        ),
      );
    },
    PuzzleListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PuzzleListScreen(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultScreen(
          key: args.key,
          result: args.result,
          coins: args.coins,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [ChopperDashGameScreen]
class ChopperDashGameRoute extends PageRouteInfo<ChopperDashGameRouteArgs> {
  ChopperDashGameRoute({
    Key? key,
    required ChopperModel chopper,
    required int coins,
    List<PageRouteInfo>? children,
  }) : super(
          ChopperDashGameRoute.name,
          args: ChopperDashGameRouteArgs(
            key: key,
            chopper: chopper,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'ChopperDashGameRoute';

  static const PageInfo<ChopperDashGameRouteArgs> page =
      PageInfo<ChopperDashGameRouteArgs>(name);
}

class ChopperDashGameRouteArgs {
  const ChopperDashGameRouteArgs({
    this.key,
    required this.chopper,
    required this.coins,
  });

  final Key? key;

  final ChopperModel chopper;

  final int coins;

  @override
  String toString() {
    return 'ChopperDashGameRouteArgs{key: $key, chopper: $chopper, coins: $coins}';
  }
}

/// generated route for
/// [ChopperDashListScreen]
class ChopperDashListRoute extends PageRouteInfo<void> {
  const ChopperDashListRoute({List<PageRouteInfo>? children})
      : super(
          ChopperDashListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChopperDashListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EnterCoinsScreen]
class EnterCoinsRoute extends PageRouteInfo<EnterCoinsRouteArgs> {
  EnterCoinsRoute({
    Key? key,
    required ChopperModel chopper,
    List<PageRouteInfo>? children,
  }) : super(
          EnterCoinsRoute.name,
          args: EnterCoinsRouteArgs(
            key: key,
            chopper: chopper,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterCoinsRoute';

  static const PageInfo<EnterCoinsRouteArgs> page =
      PageInfo<EnterCoinsRouteArgs>(name);
}

class EnterCoinsRouteArgs {
  const EnterCoinsRouteArgs({
    this.key,
    required this.chopper,
  });

  final Key? key;

  final ChopperModel chopper;

  @override
  String toString() {
    return 'EnterCoinsRouteArgs{key: $key, chopper: $chopper}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PuzzleGameScreen]
class PuzzleGameRoute extends PageRouteInfo<PuzzleGameRouteArgs> {
  PuzzleGameRoute({
    Key? key,
    required PuzzleModel puzzle,
    List<PageRouteInfo>? children,
  }) : super(
          PuzzleGameRoute.name,
          args: PuzzleGameRouteArgs(
            key: key,
            puzzle: puzzle,
          ),
          initialChildren: children,
        );

  static const String name = 'PuzzleGameRoute';

  static const PageInfo<PuzzleGameRouteArgs> page =
      PageInfo<PuzzleGameRouteArgs>(name);
}

class PuzzleGameRouteArgs {
  const PuzzleGameRouteArgs({
    this.key,
    required this.puzzle,
  });

  final Key? key;

  final PuzzleModel puzzle;

  @override
  String toString() {
    return 'PuzzleGameRouteArgs{key: $key, puzzle: $puzzle}';
  }
}

/// generated route for
/// [PuzzleListScreen]
class PuzzleListRoute extends PageRouteInfo<void> {
  const PuzzleListRoute({List<PageRouteInfo>? children})
      : super(
          PuzzleListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PuzzleListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required String result,
    required double coins,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            result: result,
            coins: coins,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.result,
    required this.coins,
  });

  final Key? key;

  final String result;

  final double coins;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, result: $result, coins: $coins}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
