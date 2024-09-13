import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

Future<void> processCheck(WidgetRef ref) async {
  final processBox = Hive.box('ProcessBox');
  await processBox.put('isLearned', true);
}

final isLearnedProvider = StateProvider<bool>((ref) => false);