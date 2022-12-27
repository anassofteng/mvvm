import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Users_Model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> SaveUser(Users_Model user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());

    return true;
  }

  Future<Users_Model> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return Users_Model(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
