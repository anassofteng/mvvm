import 'package:flutter/material.dart';
import 'package:mvvm/view_model/Services/Splash_Servces.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  Splash_Services splashservices = Splash_Services();
  @override
  void initState() {
    super.initState();
    splashservices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
                child: Center(
              child: Text(
                'Splash Screen',
                style: Theme.of(context).textTheme.headline4,
              ),
            )),
          ]),
    );
  }
}
