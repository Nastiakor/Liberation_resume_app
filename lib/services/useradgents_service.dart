import 'package:http/http.dart' as http;

class UseradgentsService {
  static Future<http.Response> fetchUseradgentsFeed() async {
     return http.get(
        Uri.parse('https://www.useradgents.com/api/wp-json/v1/posts?posts_per_page=-1'));
  }
}



