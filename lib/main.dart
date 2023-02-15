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
    // * base가 되는 app  - 구글의 material or ios 의 cupertino중에 선태 -> material 추천
    // * rule - screen must need to have scaffold (provied structure)
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(27, 26, 26, 1),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Hey, Taeeon",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                        Text("welcome, back",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18,
                            )),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text("Total Balance",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text("\$5 194 482",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Container(
                      child: const Text("Transfer"),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
