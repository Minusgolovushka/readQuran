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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme', style: Theme.of(context).textTheme.titleLarge),
                  Switch(
                    thumbIcon: WidgetStateProperty.all(Icon(Theme.of(context).brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode)),
                    activeColor: Theme.of(context).primaryColorLight,
                    value: ref.watch(themeProvider) == ThemeMode.dark, 
                    onChanged: (bool value) {ref.read(themeProvider.notifier).setTheme( value ? ThemeMode.dark : ThemeMode.light);},
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
