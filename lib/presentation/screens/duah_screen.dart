import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DuahScreen extends StatefulWidget {
  const DuahScreen({super.key});

  @override
  State<DuahScreen> createState() => _DuahScreenState();
}

class _DuahScreenState extends State<DuahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дуа'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Страница в разработке...'),
          ],
        )
      ),
    );
  }
}