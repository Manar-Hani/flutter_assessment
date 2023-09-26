import 'package:http/http.dart' as http;

class MyNetwork {
  static final client = http.Client();

  static Future<dynamic> get(String endpoint, String token) async {
    var response = await client.get(buildurl(endpoint), headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $token",
    });

    return response.body;
  }

  static Uri buildurl(String endpoint) {
    String host = "https://minaini.com:2053";
    final apipath = host + endpoint;
    return Uri.parse(apipath);
  }
}
