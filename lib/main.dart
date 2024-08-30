import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:readquran/domain/app_router.dart';
import 'package:readquran/domain/providers/theme_notifier.dart';
import 'package:readquran/domain/themes.dart';

final appRouter  = AppRouter();

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  runApp(const ProviderScope(child: MyApp()));
} 

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'ReadQuran',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter.config(),
    );
  }
}
