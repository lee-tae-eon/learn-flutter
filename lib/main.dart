import 'package:flutter/material.dart';
import 'package:toolflix/widgets/button.dart';

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
                height: 100,
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
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    text: "Transfer",
                    bgColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "Request",
                    bgColor: Color.fromARGB(115, 84, 75, 75),
                    textColor: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      // * opacity 같은 값은 compile 할때 알기 힘든 값이라 constant가 될 수 없다.
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(115, 84, 75, 75),
                      borderRadius: BorderRadius.circular(
                        25,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Euro",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "6 428",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "EUR",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
