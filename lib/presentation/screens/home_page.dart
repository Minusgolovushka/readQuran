import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Quran App'),
      actions: [
        IconButton(
          onPressed: () {context.router.push(const SettingsRoute());}, 
          icon: const Icon(Icons.settings)),
      ],
    ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Theme.of(context).cardColor,
                      onTap: () {context.router.push(const QuranRoute());},
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text('Surahs'),
                        ),
                      )
                    ),
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}