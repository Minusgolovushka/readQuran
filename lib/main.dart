import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.dart';

final appRouter  = AppRouter();
void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ReadQuran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24),
          bodyMedium: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          bodySmall: TextStyle(fontSize: 12),
          // TODO: Перенести все стили текста по красоте жи есть
        ),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
