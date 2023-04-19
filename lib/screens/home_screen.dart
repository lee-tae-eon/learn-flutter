import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold는 기본적인 레이아웃과 설정을 제공해줌
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.green,
        title: const Text(
          "Today's Toon's",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
