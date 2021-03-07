// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login screen`
  String get login_title {
    return Intl.message(
      'Login screen',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get password_cant_be_empty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'password_cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Login can't be empty`
  String get login_cant_be_empty {
    return Intl.message(
      'Login can\'t be empty',
      name: 'login_cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get type_your_login {
    return Intl.message(
      'Username',
      name: 'type_your_login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get type_your_password {
    return Intl.message(
      'Password',
      name: 'type_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `IP address or domain name`
  String get type_ip_or_domain {
    return Intl.message(
      'IP address or domain name',
      name: 'type_ip_or_domain',
      desc: '',
      args: [],
    );
  }

  /// `IP address or domain name can't be empty`
  String get ip_cant_be_empty {
    return Intl.message(
      'IP address or domain name can\'t be empty',
      name: 'ip_cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Information screen`
  String get presenter_title {
    return Intl.message(
      'Information screen',
      name: 'presenter_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}