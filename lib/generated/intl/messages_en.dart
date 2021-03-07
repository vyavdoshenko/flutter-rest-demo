// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "ip_cant_be_empty" : MessageLookupByLibrary.simpleMessage("IP address or domain name can\'t be empty"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "login_cant_be_empty" : MessageLookupByLibrary.simpleMessage("Login can\'t be empty"),
    "login_title" : MessageLookupByLibrary.simpleMessage("Login screen"),
    "password_cant_be_empty" : MessageLookupByLibrary.simpleMessage("Password can\'t be empty"),
    "presenter_title" : MessageLookupByLibrary.simpleMessage("Information screen"),
    "type_ip_or_domain" : MessageLookupByLibrary.simpleMessage("IP address or domain name"),
    "type_your_login" : MessageLookupByLibrary.simpleMessage("Username"),
    "type_your_password" : MessageLookupByLibrary.simpleMessage("Password")
  };
}
