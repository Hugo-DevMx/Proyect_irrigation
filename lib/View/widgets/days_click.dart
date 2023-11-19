import 'package:flutter/material.dart';

class DaysLaps extends StatefulWidget {
  const DaysLaps({
    super.key,
  });

  @override
  State<DaysLaps> createState() => _DaysLapsState();
}

class _DaysLapsState extends State<DaysLaps> {
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  Color color5 = Colors.grey;
  Color color6 = Colors.grey;
  Color color7 = Colors.grey;
  bool isGreen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(children: [
          const Text(
            'Dias',
            style: TextStyle(fontFamily: 'Chroma', color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color1,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color1 = Colors.grey; // Cambia a rojo
                          } else {
                            color1 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Lu',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color2,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color2 = Colors.grey; // Cambia a rojo
                          } else {
                            color2 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Ma',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color3,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color3 = Colors.grey; // Cambia a rojo
                          } else {
                            color3 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Mi',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color4,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color4 = Colors.grey; // Cambia a rojo
                          } else {
                            color4 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Ju',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color5,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color5 = Colors.grey; // Cambia a rojo
                          } else {
                            color5 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Vi',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color6,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color6 = Colors.grey; // Cambia a rojo
                          } else {
                            color6 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Sa',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeInOutQuad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: color7,
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (isGreen) {
                            color7 = Colors.grey; // Cambia a rojo
                          } else {
                            color7 = Colors.green; // Cambia a verde
                          }
                          isGreen = !isGreen; // Alterna el estado
                        });
                      },
                      child: const Text('Do',
                          style: TextStyle(
                              fontFamily: 'Chroma', color: Colors.white))),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
