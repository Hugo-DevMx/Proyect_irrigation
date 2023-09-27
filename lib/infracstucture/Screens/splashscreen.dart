import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irrigation/infracstucture/Screens/loginStart.dart';
import 'package:jumping_dot/jumping_dot.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // After 3 seconds in the splash-screen show the login screen.
    // pushReplacment -> Remove of the stack this screen.
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginStart())));
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/fondos.png"), context);
    precacheImage(const AssetImage("assets/images/backgroundImage1.jpeg"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 8, 75, 51)),
        child: Column(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SvgPicture.asset('assets/images/logo.svg', width: 150),
                const SizedBox(
                  height: 20,
                ),
                JumpingDots(
                  color: Colors.white,
                  radius: 10,
                  numberOfDots: 3,
                  animationDuration: const Duration(milliseconds: 300),
                  verticalOffset: -10,
                  innerPadding: 3,
                )
              ])),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Column(children: [
              Text(
                "from",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Chroma"),
              ),
              Text(
                "MACH",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Chroma"),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
