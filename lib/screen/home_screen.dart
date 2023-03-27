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
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text("25:00",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    )),
              )),
          const Flexible(flex: 2, child: Center()),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
