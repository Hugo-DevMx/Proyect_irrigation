import 'package:flutter/material.dart';

class AppBarIrrigation extends StatelessWidget {
  final String title;
  final IconData icon;
  const AppBarIrrigation({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Color.fromARGB(255, 8, 75, 51)),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Chroma', fontSize: 24, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
