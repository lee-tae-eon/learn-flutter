import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(result.body);
      for (var web in webtoons) {
        print(web);
      }

      return;
    }
    throw Error();
  }
}
