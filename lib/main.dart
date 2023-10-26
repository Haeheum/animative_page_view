import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: PageViewPage(),
      ),
    );
  }
}

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.7);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: 3,
      itemBuilder: (context, position) {
        return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001),
            alignment: Alignment.center,
            child: PageViewItem(position: position, showBack: false,),);
      },
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.position, required this.showBack, Key? key})
      : super(key: key);
  final int position;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return showBack
        ? Image.asset('assets/card_back_1.jpeg')
        : Image.asset('assets/card_$position.webp');
  }
}
