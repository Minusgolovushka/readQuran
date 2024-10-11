// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:readquran/presentation/screens/books_screen.dart' as _i1;
import 'package:readquran/presentation/screens/current_surah_screen.dart'
    as _i2;
import 'package:readquran/presentation/screens/duah_screen.dart' as _i3;
import 'package:readquran/presentation/screens/hadith_screen.dart' as _i4;
import 'package:readquran/presentation/screens/home_page.dart' as _i5;
import 'package:readquran/presentation/screens/in_progress_surahs_screen.dart'
    as _i6;
import 'package:readquran/presentation/screens/learned_surahs_screen.dart'
    as _i7;
import 'package:readquran/presentation/screens/namaz_screen.dart' as _i8;
import 'package:readquran/presentation/screens/quran_screen.dart' as _i9;
import 'package:readquran/presentation/screens/settings_screen.dart' as _i10;

/// generated route for
/// [_i1.BooksScreen]
class BooksRoute extends _i11.PageRouteInfo<void> {
  const BooksRoute({List<_i11.PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.BooksScreen();
    },
  );
}

/// generated route for
/// [_i2.CurrentSurahScreen]
class CurrentSurahRoute extends _i11.PageRouteInfo<CurrentSurahRouteArgs> {
  CurrentSurahRoute({
    _i12.Key? key,
    required int number,
    required String name,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CurrentSurahRouteArgs>();
      return _i2.CurrentSurahScreen(
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

  final _i12.Key? key;

  final int number;

  final String name;

  @override
  String toString() {
    return 'CurrentSurahRouteArgs{key: $key, number: $number, name: $name}';
  }
}

/// generated route for
/// [_i3.DuahScreen]
class DuahRoute extends _i11.PageRouteInfo<void> {
  const DuahRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DuahRoute.name,
          initialChildren: children,
        );

  static const String name = 'DuahRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.DuahScreen();
    },
  );
}

/// generated route for
/// [_i4.HadithScreen]
class HadithRoute extends _i11.PageRouteInfo<void> {
  const HadithRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HadithRoute.name,
          initialChildren: children,
        );

  static const String name = 'HadithRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.HadithScreen();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.InProgressSurahsScreen]
class InProgressSurahsRoute extends _i11.PageRouteInfo<void> {
  const InProgressSurahsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InProgressSurahsRoute.name,
          initialChildren: children,
        );

  static const String name = 'InProgressSurahsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.InProgressSurahsScreen();
    },
  );
}

/// generated route for
/// [_i7.LearnedSurahsScreen]
class LearnedSurahsRoute extends _i11.PageRouteInfo<void> {
  const LearnedSurahsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LearnedSurahsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnedSurahsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.LearnedSurahsScreen();
    },
  );
}

/// generated route for
/// [_i8.NamazScreen]
class NamazRoute extends _i11.PageRouteInfo<void> {
  const NamazRoute({List<_i11.PageRouteInfo>? children})
      : super(
          NamazRoute.name,
          initialChildren: children,
        );

  static const String name = 'NamazRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.NamazScreen();
    },
  );
}

/// generated route for
/// [_i9.QuranScreen]
class QuranRoute extends _i11.PageRouteInfo<void> {
  const QuranRoute({List<_i11.PageRouteInfo>? children})
      : super(
          QuranRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.QuranScreen();
    },
  );
}

/// generated route for
/// [_i10.SettingsScreen]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsScreen();
    },
  );
}
