import 'package:flutter/material.dart';
import 'package:toolflix/models/webtoon_model.dart';
import 'package:toolflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var webtoon in snapshot.data!) Text(webtoon.title)
              ],
            );
          }
          return const Center(
            // loading indicator
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
