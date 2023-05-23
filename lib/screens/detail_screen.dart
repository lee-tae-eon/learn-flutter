import 'package:flutter/material.dart';
import 'package:toolflix/models/webtoon_detail_model.dart';
import 'package:toolflix/models/webtoon_episode_model.dart';
import 'package:toolflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 3,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Colors.green,
          title: Text(
            // * widget  => this widget =DetailScreen
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
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
                        widget.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                          "Referer": "https://comic.naver.com"
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
