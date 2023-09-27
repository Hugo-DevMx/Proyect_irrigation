import 'package:flutter/material.dart';
import 'package:irrigation/infracstucture/Screens/splashScreen.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 8, 75, 51)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}