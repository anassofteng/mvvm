import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/User_View_Model.dart';
import 'package:provider/provider.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                userPreference.remove().then(
                    (value) => Navigator.pushNamed(context, RoutesName.login));
              },
              child: Icon(Icons.logout_outlined)),
        ),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('home Screen')),
        ],
      ),
    );
  }
}
