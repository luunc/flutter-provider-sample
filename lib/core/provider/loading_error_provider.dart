import 'package:dxdart/core/errors/base_error.dart';
import 'package:flutter/foundation.dart';

class LoadingErrorProvider with ChangeNotifier {
  bool _loading = false;

  BaseError _error;

  bool get loading => _loading;

  BaseError get error => _error;

  void changeLoading(bool on) {
    _loading = on;
  }

  void changeError(BaseError error) {
    _error = error;
  }
}
