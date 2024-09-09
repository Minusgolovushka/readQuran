// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:readquran/presentation/screens/current_surah_screen.dart'
    as _i1;
import 'package:readquran/presentation/screens/home_page.dart' as _i2;
import 'package:readquran/presentation/screens/quran_screen.dart' as _i3;
import 'package:readquran/presentation/screens/settings_screen.dart' as _i4;

/// generated route for
/// [_i1.CurrentSurahScreen]
class CurrentSurahRoute extends _i5.PageRouteInfo<CurrentSurahRouteArgs> {
  CurrentSurahRoute({
    _i6.Key? key,
    required int number,
    required String name,
    List<_i5.PageRouteInfo>? children,
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

  static _i5.PageInfo page = _i5.PageInfo(
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

  final _i6.Key? key;

  final int number;

  final String name;

  @override
  String toString() {
    return 'CurrentSurahRouteArgs{key: $key, number: $number, name: $name}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.QuranScreen]
class QuranRoute extends _i5.PageRouteInfo<void> {
  const QuranRoute({List<_i5.PageRouteInfo>? children})
      : super(
          QuranRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.QuranScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}
