import 'dart:async';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'http_utils.dart';
import 'network_exception.dart';
import 'request_factory.dart';
import 'response_factory.dart';

class ApiProvider {
  static http.Client client = http.Client();

  static Future login(String ip, String login, String password) async {
    final response = await client.send(
      HttpUtils.createPostRequest(
        'https://$ip/api/login',
        RequestFactory.createLogin(
          login,
          password,
        ),
      ),
    );

    var body = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw NetworkException(
          'Login error. HTTP status code: ${response.statusCode}. Body: $body');
    }

    return ResponseFactory.parseLogin(body);
  }

  static Future getInformation(String ip, String token) async {
    final response = await client.send(
      HttpUtils.createGetRequest(
        'https://$ip/api/system',
        'token=$token',
      ),
    );

    var body = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw NetworkException(
          'Get information error. HTTP status code: ${response.statusCode}. Body: $body');
    }

    return body;
  }
}
