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
// * constant 는 수정할 수 없고 compile 전에 그 value를 알 수 있는 변수

// * statefull widget  ->  state에 따 유동적으로 바뀌는 ui
// * 2개의 part로 나뉨 statefulwidget class와 state class
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  List<int> numbers = [];

  void onClick() {
    // * setState 함수 -> State class 에 data가 변경 되었다고 알려주는 함수.
    // * 실행되어야 하는 코드가 setState에 있지 않아도 실행이 된다.
    // * setState로 인해 ui가 다시 빌드 되기 때문이다.
    // counter = counter + 1;
    // setState(() => {});
    print(numbers);
    setState(() => {counter = counter + 1, numbers.add(numbers.length)});
  }

  // * override 부모 클래스의 메소드를 덮어씌움
  @override
  Widget build(BuildContext context) {
    // * base가 되는 app  - 구글의 material or ios 의 cupertino중에 선태 -> material 추천
    // * rule - screen must need to have scaffold (provied structure)
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Click Count",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                  onPressed: onClick,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
