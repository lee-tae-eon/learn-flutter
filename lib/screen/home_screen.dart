import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // ui 를 responsible 하게 함
          Flexible(flex: 1, child: Container()),
          Flexible(flex: 2, child: Container()),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
