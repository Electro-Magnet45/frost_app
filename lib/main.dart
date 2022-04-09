import 'package:flutter/material.dart';
import 'package:frost/pages/onboarding.dart';

void main() => runApp(const AppRoot());

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
        title: 'Frost',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0XFF8082DD),
            scaffoldBackgroundColor: Colors.white),
        home: const OnBoarding());
  }
}
