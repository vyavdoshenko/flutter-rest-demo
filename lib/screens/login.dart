import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shake_box/shake_box.dart';

import '../constants.dart';
import '../generated/l10n.dart';
import '../model/data.dart';
import '../model/spinner.dart';
import '../rest/api_provider.dart';
import '../screens/presenter.dart';
import '../utils.dart';

class Login extends StatelessWidget {
  static const String navigatorId = 'login_screen';

  final _ipShakeNotifier = ShakeNotifier();
  final _loginShakeNotifier = ShakeNotifier();
  final _passwordShakeNotifier = ShakeNotifier();
  final _loginButtonShakeNotifier = ShakeNotifier();

  final _ipTextController = TextEditingController();
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.login_title),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Spinner>(context).spinnerState,
        child: Container(
          decoration: buildGradientBoxDecoration(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    height: 40.0,
                  ),
                ),
                ShakerBox(
                  _ipShakeNotifier,
                  TextFormField(
                    controller: _ipTextController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: inputDecoration.copyWith(
                      hintText: '',
                      labelText: S.current.type_ip_or_domain,
                      labelStyle: TextStyle(
                        color: Colors.blue.shade300,
                      ),
                      prefixIcon: Icon(
                        Icons.account_tree,
                        color: Colors.blue.shade200,
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return value.isNotEmpty
                          ? null
                          : S.current.ip_cant_be_empty;
                    },
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 40.0,
                  ),
                ),
                Column(
                  children: [
                    ShakerBox(
                      _loginShakeNotifier,
                      TextFormField(
                        controller: _loginTextController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration.copyWith(
                          hintText: '',
                          labelText: S.current.type_your_login,
                          labelStyle: TextStyle(
                            color: Colors.blue.shade300,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue.shade200,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String value) {
                          return value.isNotEmpty
                              ? null
                              : S.current.login_cant_be_empty;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ShakerBox(
                      _passwordShakeNotifier,
                      TextFormField(
                        controller: _passwordTextController,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: inputDecoration.copyWith(
                          labelText: S.current.type_your_password,
                          labelStyle: TextStyle(
                            color: Colors.blue.shade300,
                          ),
                          hintText: '',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue.shade200,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String value) {
                          return value.isNotEmpty
                              ? null
                              : S.current.password_cant_be_empty;
                        },
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: SizedBox(
                    height: 30.0,
                  ),
                ),
                Flexible(
                  child: ShakerBox(
                    _loginButtonShakeNotifier,
                    RoundedButton(
                      onPressed: () => login(context),
                      color: Theme.of(context).primaryColorLight,
                      title: S.current.login,
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(context) async {
    Provider.of<Spinner>(context, listen: false).showSpinner(true);

    final ip = _ipTextController.text;
    if (ip.isEmpty) {
      Provider.of<Spinner>(context, listen: false).showSpinner(false);
      _ipShakeNotifier.shake();
      return;
    }

    final login = _loginTextController.text;
    if (login.isEmpty) {
      Provider.of<Spinner>(context, listen: false).showSpinner(false);
      _loginShakeNotifier.shake();
      return;
    }

    final password = _passwordTextController.text;
    if (password.isEmpty) {
      Provider.of<Spinner>(context, listen: false).showSpinner(false);
      _passwordShakeNotifier.shake();
      return;
    }

    try {
      final String token = await ApiProvider.login(ip, login, password);

      Provider.of<Data>(context, listen: false).jsonData =
          json.decode(await ApiProvider.getInformation(
        ip,
        token,
      ));

      Provider.of<Spinner>(context, listen: false).showSpinner(false);
      Navigator.pushNamed(context, Presenter.navigatorId);
      return;
    } catch (err) {
      print("Login or get data error: $err");
    }

    Provider.of<Spinner>(context, listen: false).showSpinner(false);
    _loginButtonShakeNotifier.shake();
  }
}
