import 'package:flutter/material.dart';
import 'package:irrigation/Screens/login.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}