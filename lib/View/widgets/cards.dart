import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:irrigation/Model/domain/model_home_cards.dart';
import 'package:irrigation/constatns.dart';

class CardAreasHome extends StatefulWidget {
  const CardAreasHome({super.key});

  @override
  State<CardAreasHome> createState() => _CardAreasHomeState();
}

class _CardAreasHomeState extends State<CardAreasHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasData) {
            var items = data.data as List<ModelCards>;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.49)
                      : MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 0.36),),
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(225, 8, 75, 51),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsetsDirectional.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(items[index].imageUrl.toString())),
                        ),
                        const Spacer(),
                         Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                items[index].nameArea.toString(),
                                style: const TextStyle(
                                    fontFamily: 'Chroma',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(items[index].typeArea.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Chroma',
                                      color: Colors.white))),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  color: Colors.amber[600],
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(items[index].state.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Chroma',
                                          fontSize: 12,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const DetailsScreen()));
                                },
                                icon: const Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                  );
                });
                } else if (data.hasError) {
              return  Center(
                child: Text('${data.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        });
  }

  Future<List<ModelCards>> ReadJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('json/data_cards.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelCards.fromJson(e)).toList();
  }
}
