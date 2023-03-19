import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// color - background : 0xFFE7626C
// headline : 0xFF232B55
// card : 0xFFF4EDDB
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        backgroundColor: const Color(
          0xFFE7626C,
        ),
      )),
    );
  }
}
