import 'package:http/http.dart' as http;

class HttpUtils {
  static http.Request createPostRequest(String url, String body) =>
      http.Request(
        'POST',
        Uri.parse(url),
      )
        ..headers['Content-Type'] = 'application/json'
        ..body = body;

  static http.Request createGetRequest(String url, String cookie) =>
      http.Request(
        'GET',
        Uri.parse(url),
      )
        ..headers['Content-Type'] = 'application/json'
        ..headers['Cookie'] = cookie;
}
