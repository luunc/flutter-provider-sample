import 'package:flutter/foundation.dart';

class LoadingErrorProvider with ChangeNotifier {
  bool _loading = false;

  Exception _error;

  bool get loading => _loading;

  Exception get error => _error;

  void changeLoading(bool on) {
    _loading = on;
  }

  void changeError(Exception error) {
    _error = error;
  }
}
