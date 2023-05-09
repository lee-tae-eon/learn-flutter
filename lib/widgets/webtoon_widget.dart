import 'package:flutter/material.dart';
import 'package:toolflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // gesturedetector는 대부분의 동작을 감지한다.
    return GestureDetector(
      onTap: () {
        // route 는 위젯과 다르다.
        // route는 위젯을 애니메이션 효과로 감싸서 스크린처럼 보이도록 하는 역할.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // * hero widget => likely framer motion - Animation prescense
          // * tag id  -> another card id matching
          Hero(
            tag: id,
            child: Container(
              width: 250,
              // 자식의 부모 영역 침범을 제하는 방법.
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.7))
                  ]),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Image.network(
                  thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    "Referer": "https://comic.naver.com"
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
