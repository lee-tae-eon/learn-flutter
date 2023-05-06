import 'package:flutter/material.dart';
import 'package:toolflix/models/webtoon_model.dart';
import 'package:toolflix/services/api_service.dart';
import 'package:toolflix/widgets/webtoon_widget.dart';

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
            // dynamic builder
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // 따로 User-Agent 값을 추가하지 않으면 기본값으로 `Dart/<version> (dart:io)` 가 들어갑니다.
    // (https://api.flutter.dev/flutter/dart-io/HttpClient/userAgent.html)

    // 이 값을 지우고 브라우저에서 사용하는 값으로 바꿔줍니다.
    // (브라우저 값이 아니면 네이버에서 차단하는걸로 보입니다)
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 40);
      },
    );
  }
}
