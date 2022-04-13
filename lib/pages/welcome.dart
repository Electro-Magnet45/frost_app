import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:frost/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarColor: primaryColor,
                statusBarColor: primaryColor,
                statusBarIconBrightness: Brightness.light),
            child: SafeArea(
                child: DefaultTextStyle(
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'ComicNeue',
                  fontWeight: FontWeight.w700),
              child: Center(
                child: Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Pulse(
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: Offset(0, 20),
                                      blurRadius: 28,
                                      color: Colors.black26,
                                      spreadRadius: 0.5)
                                ]),
                            child: const Icon(Icons.face,
                                color: Colors.white, size: 82)),
                      )),
                  const SizedBox(height: 20),
                  const Text("Hi there,\nI'm Frost",
                      style: TextStyle(fontSize: 46)),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                        'Nothing much to tell about me. You are the star here!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(245, 213, 213, 213),
                            fontSize: 22)),
                  ),
                  const Spacer(),
                  SizedBox(
                      width: _size.width - 120,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text('Hi Frost',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'VarelaRound')))),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text('I ALREADY HAVE AN ACCOUNT',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(245, 213, 213, 213),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'VarelaRound')),
                  )
                ]),
              ),
            ))));
  }
}
