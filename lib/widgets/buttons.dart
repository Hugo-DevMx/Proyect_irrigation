import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final ImageIcon? buttonIcon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  const Buttons(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.padding,
      this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: const Color.fromARGB(255, 8, 75, 51),
            padding: padding),
        child: Text(buttonText,
            style: const TextStyle(
                fontFamily: 'Chroma', color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
