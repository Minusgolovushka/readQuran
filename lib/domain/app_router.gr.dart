// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:readquran/presentation/screens/current_surah_screen.dart'
    as _i1;
import 'package:readquran/presentation/screens/home_page.dart' as _i2;
import 'package:readquran/presentation/screens/in_progress_surahs_screen.dart'
    as _i3;
import 'package:readquran/presentation/screens/learned_surahs_screen.dart'
    as _i4;
import 'package:readquran/presentation/screens/quran_screen.dart' as _i5;
import 'package:readquran/presentation/screens/settings_screen.dart' as _i6;

/// generated route for
/// [_i1.CurrentSurahScreen]
class CurrentSurahRoute extends _i7.PageRouteInfo<CurrentSurahRouteArgs> {
  CurrentSurahRoute({
    _i8.Key? key,
    required int number,
    required String name,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CurrentSurahRoute.name,
          args: CurrentSurahRouteArgs(
            key: key,
            number: number,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'CurrentSurahRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CurrentSurahRouteArgs>();
      return _i1.CurrentSurahScreen(
        key: args.key,
        number: args.number,
        name: args.name,
      );
    },
  );
}

class CurrentSurahRouteArgs {
  const CurrentSurahRouteArgs({
    this.key,
    required this.number,
    required this.name,
  });

  final _i8.Key? key;

  final int number;

  final String name;

  @override
  String toString() {
    return 'CurrentSurahRouteArgs{key: $key, number: $number, name: $name}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.InProgressSurahsScreen]
class InProgressSurahsRoute extends _i7.PageRouteInfo<void> {
  const InProgressSurahsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InProgressSurahsRoute.name,
          initialChildren: children,
        );

  static const String name = 'InProgressSurahsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.InProgressSurahsScreen();
    },
  );
}

/// generated route for
/// [_i4.LearnedSurahsScreen]
class LearnedSurahsRoute extends _i7.PageRouteInfo<void> {
  const LearnedSurahsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LearnedSurahsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnedSurahsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.LearnedSurahsScreen();
    },
  );
}

/// generated route for
/// [_i5.QuranScreen]
class QuranRoute extends _i7.PageRouteInfo<void> {
  const QuranRoute({List<_i7.PageRouteInfo>? children})
      : super(
          QuranRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.QuranScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}
