import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final result = await http.get(url);
    if (result.statusCode == 200) {
      print(result.body);
      return;
    }
    throw Error();
  }
}
