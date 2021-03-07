// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "ip_cant_be_empty" : MessageLookupByLibrary.simpleMessage("IP или доменное имя не может быть пустым"),
    "login" : MessageLookupByLibrary.simpleMessage("Вход"),
    "login_cant_be_empty" : MessageLookupByLibrary.simpleMessage("Пользователь не может быть пустым"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Экран входа"),
    "password_cant_be_empty" : MessageLookupByLibrary.simpleMessage("Пароль не может быть пустым"),
    "presenter_title" : MessageLookupByLibrary.simpleMessage("Информация"),
    "type_ip_or_domain" : MessageLookupByLibrary.simpleMessage("IP или доменное имя"),
    "type_your_login" : MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "type_your_password" : MessageLookupByLibrary.simpleMessage("Пароль")
  };
}
