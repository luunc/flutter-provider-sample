import 'package:dxdart/core/errors/login_error.dart';
import 'package:dxdart/core/provider/loading_error_provider.dart';

class UserLoginProvider extends LoadingErrorProvider {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  Future<void> loginSuccess() async {
    print("loginSuccess");
    changeLoading(true);
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    changeLoading(false);
    _isLogin = true;
    notifyListeners();
  }

  Future<void> loginFailed() async {
    changeLoading(true);
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    changeLoading(false);
    changeError(LoginError());
    notifyListeners();
  }

  void logout() async {
    _isLogin = false;
    notifyListeners();
  }
}
