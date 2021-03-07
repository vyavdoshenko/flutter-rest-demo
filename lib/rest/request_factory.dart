import 'dart:convert';

class RequestFactory {
  static String createLogin(String username, String password) {
    return json.encode(
      {
        'username': username,
        'password': password,
      },
    );
  }
}
