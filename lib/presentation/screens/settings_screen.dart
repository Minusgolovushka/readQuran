import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/providers/theme_notifier.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {ref.read(themeProvider.notifier).setTheme(ThemeMode.light);}, 
                  child: const Icon(Icons.sunny)
                ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {ref.read(themeProvider.notifier).setTheme(ThemeMode.dark);}, 
                  child: const Icon(Icons.monochrome_photos)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
