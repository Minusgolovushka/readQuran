import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:readquran/domain/app_router.gr.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () { context.router.push(const QuranRoute()); },
          ),
          IconButton(
            icon: const Icon(Icons.timelapse),
            onPressed: () { context.router.push(const InProgressSurahsRoute()); },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () { context.router.push(const LearnedSurahsRoute()); },
          ),
        ],
      ),
    );
  }
}