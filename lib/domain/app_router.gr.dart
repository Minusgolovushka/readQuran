// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:readquran/presentation/screens/current_surah_screen.dart'
    as _i1;
import 'package:readquran/presentation/screens/home_screen.dart' as _i2;
import 'package:readquran/presentation/screens/settings_screen.dart' as _i3;

/// generated route for
/// [_i1.CurrentSurahScreen]
class CurrentSurahRoute extends _i4.PageRouteInfo<CurrentSurahRouteArgs> {
  CurrentSurahRoute({
    _i5.Key? key,
    required int number,
    required String name,
    List<_i4.PageRouteInfo>? children,
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

  static _i4.PageInfo page = _i4.PageInfo(
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

  final _i5.Key? key;

  final int number;

  final String name;

  @override
  String toString() {
    return 'CurrentSurahRouteArgs{key: $key, number: $number, name: $name}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsScreen();
    },
  );
}
