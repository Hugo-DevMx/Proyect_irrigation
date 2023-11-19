import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:irrigation/Model/domain/model_home_cards.dart';
import '../../../constatns.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  final color1 = const Color.fromRGBO(21, 168, 155, 100);
  final color2 = const Color.fromARGB(84, 0, 0, 0);
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Error De Datos',
            style: TextStyle(fontFamily: 'Chroma', color: Colors.black)),
        content: const Text(
            'Verifica tu conexion de internet para poder visualizar los datos',
            style: TextStyle(fontFamily: 'Chroma', fontSize: 12)),
        actions: [
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(3, 159, 0, 100)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen())),
              child: const Text('Reintentar',
                  style: TextStyle(
                      fontFamily: 'Chroma', fontSize: 12, color: Colors.white)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data,) {
              if (data.hasData) {
                var items = data.data as List<ModelCards>;
                return Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/details.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                      Column(
                        children: [
                           const AppBarIrrigation(
                            icon: Icons.arrow_back,
                            title: 'Area',
                          ),
                          const PowerSensor(),
                          Humidity(color1: color1, color2: color2),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 300,
                                color: Color.lerp(color1, color2, 0.25),
                                child: const Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  'assets/images/timer.png')),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              'Tiempo',
                                              style: TextStyle(
                                                  fontFamily: 'Chroma',
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: DownButton(),
                                    ),
                                    DaysLaps()
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else if (data.hasError) {
              return  Center(
                child: Text('${data.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
            }));
  }

  Future<List<ModelCards>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('json/data_cards.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelCards.fromJson(e)).toList();
  }
}
