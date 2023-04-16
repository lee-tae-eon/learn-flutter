import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMin = 1500;

  int totalSeconds = twentyFiveMin;
  int totalPomodoros = 0;
  bool isRunning = false;

  late Timer timer;

  void onThick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMin;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onPressed() {
    if (!isRunning) {
      timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ),
        onThick,
      );
    } else {
      timer.cancel();
    }
    setState(() {
      isRunning = !isRunning;
    });
  }

  // * duration 함수 => 시간단위 변환.
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var timeformat = duration.toString().split(".").first.substring(2, 7);
    return timeformat;
  }

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
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: onPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_filled_outlined
                          : Icons.play_circle_outline,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    iconSize: 48,
                    color: Theme.of(context).cardColor,
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.refresh_rounded,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).cardColor,
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
