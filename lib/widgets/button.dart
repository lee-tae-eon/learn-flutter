import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      // * padding 안의 요소들이 constant 한 값이라면 Padding이 constant여야 하지만
      // * class의  property들을 받아서 바뀌는 변수로 처리 하는 이상 const가 될 수 없기때문에
      // * const 처리가 되는 edge부분만 const로 변경하면 된다.
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ))),
    );
  }
}
