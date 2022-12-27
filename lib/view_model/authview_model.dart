import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _SignUpLoading = false;
  bool get SignUpLoading => _SignUpLoading;

  setLoading(bool value) {
    _SignUpLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErroressage('Login successfuly', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, StackTrace) {
      if (kDebugMode) {
        Utils.flushBarErroressage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> SignupApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.SignupApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErroressage('Register Successfuly', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, StackTrace) {
      if (kDebugMode) {
        Utils.flushBarErroressage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
