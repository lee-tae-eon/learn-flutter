import 'package:flutter/material.dart';
import 'package:toolflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // 이 위젯으 key를 statless widget이라는 슈퍼클래스에 보낸것이다.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
