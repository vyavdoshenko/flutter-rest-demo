import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'generated/l10n.dart';
import 'model/data.dart';
import 'model/spinner.dart';
import 'screens/login.dart';
import 'screens/presenter.dart';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // TODO: Remove this workaround. This is the way to pass through self-signed certificates.
  HttpOverrides.global = new AppHttpOverrides();
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Spinner(),
        ),
      ],
      child: MaterialApp(
        title: appTitle,
        initialRoute: Login.navigatorId,
        routes: {
          Login.navigatorId: (context) => Login(),
          Presenter.navigatorId: (context) => Presenter(),
        },
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Login(),
      ),
    );
  }
}
