import 'package:flutter/foundation.dart';

class Spinner extends ChangeNotifier {
  bool _showSpinner = false;
  bool get spinnerState => _showSpinner;

  void showSpinner(bool state) {
    _showSpinner = state;
    notifyListeners();
  }
}
