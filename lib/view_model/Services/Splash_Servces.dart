import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Models/Users_Model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/User_View_Model.dart';

class Splash_Services {
  Future<Users_Model> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
