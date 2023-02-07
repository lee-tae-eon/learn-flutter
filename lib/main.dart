import 'package:flutter/material.dart';

// * flutter 는 위젯을 조합해서 애플리케이션을 만든다
// * https://docs.flutter.dev/development/ui/widgets - 공식 widgets
// * widgets을 만드는 것은 just add class
void main() {
  runApp(const App());
}

// ! flutter sdk 에 있는 3개의 core widget중 하나를 extend 해야 한다.
// ! build method 를 구현해야함.
// ! flutter가 실행 및 build 메소드가 어떤 것을 return하던지 화면에 구현된다.
class App extends StatelessWidget {
  const App({super.key});

  // * override 부모 클래스의 메소드를 덮어씌움
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Text("hello world!"));
  }
}
