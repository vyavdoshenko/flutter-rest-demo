import 'dart:convert';

import 'network_exception.dart';

class ResponseFactory {
  static Map<String, dynamic> _parse(String data) {
    final map = json.decode(data) as Map<String, dynamic>;
    if (map['status'] == null) {
      throw NetworkException('json error. status field is absent');
    }

    if (map['status'] != 'success') {
      if (map['error'] == null) {
        throw NetworkException('json error. unknown error');
      }

      throw NetworkException(map['error']);
    }

    return map['result'] as Map<String, dynamic>;
  }

  static String parseLogin(String data) {
    final result = _parse(data);

    if (result == null) {
      throw NetworkException('Parse login response error. Result is null.');
    }

    return result['token'];
  }
}
