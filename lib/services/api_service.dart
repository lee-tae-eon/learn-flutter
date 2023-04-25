import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toolflix/models/webtoon_model.dart';

class ApiService {
// * final is a variable that once created can't be reassigned.
// * static is a property of a class.
// * const is a variable that should be known at compile time.

  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];

    final url = Uri.parse("$baseUrl/$today");
    final result = await http.get(url);
    if (result.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(result.body);
      for (var web in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(web));
      }

      return webtoonInstance;
    }
    throw Error();
  }
}
