import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran App'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    imagePath: "assets/images/islam_book-100.jpg",
                    label: 'Коран',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                  CategoryCard(
                    imagePath: "assets/images/islam_svitok-100.jpg",
                    label: 'Хадисы',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    imagePath: "assets/images/islam_kibla-100.jpg",
                    label: 'Дуа',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                  CategoryCard(
                    imagePath: "assets/images/islam_mosque-100.jpg",
                    label: 'Намаз',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                    imagePath: "assets/images/islam_namaz-100.jpg",
                    label: 'Скоро',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                  CategoryCard(
                    imagePath: "assets/images/islam_book_closed-100.jpg",
                    label: 'Скоро',
                    onTap: () => context.router.push(const QuranRoute()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  CategoryCardState createState() => CategoryCardState();
}

class CategoryCardState extends State<CategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              setState(() {
                _isPressed = true;
              });
              Future.delayed(const Duration(milliseconds: 200), () {
                setState(() {
                  _isPressed = false;
                });
                widget.onTap();
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isPressed ? 150 : 160,
              height: _isPressed ? 150 : 160,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
