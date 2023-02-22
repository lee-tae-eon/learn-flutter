import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F2123),
        borderRadius: BorderRadius.circular(45),
      ),
      child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Text("Request",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ))),
    );
  }
}
