import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Humidity extends StatefulWidget {
  const Humidity({
    super.key,
    required this.color1,
    required this.color2,
  });

  final Color color1;
  final Color color2;

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  String _humedad = '';
  StreamSubscription<DatabaseEvent>? _subscription;
  
  @override
  void initState() {
    super.initState();
    // Obtener una referencia al nodo que deseamos escuchar
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("cobaej_talpa/area1/sensor1/humedad/");
    // Escuchar cambios en tiempo real
    _subscription = ref.onValue.listen((event) {
      final data = event.snapshot.value.toString();
      _humedad = data;
       setState(() {
      });
    });
  }

  @override
  void dispose() {
    // Cerrar la suscripción
    _subscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          color: Color.lerp(widget.color1, widget.color2, 0.25),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image(image: AssetImage('assets/images/gota.png')),
              ),
              const Spacer(),
              const Text(
                'Humedad',
                style: TextStyle(
                    fontFamily: 'Chroma', color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text('$_humedad%',
                    style: const TextStyle(
                        fontFamily: 'Chroma',
                        color: Colors.white,
                        fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  // read() async {
  //   FirebaseDatabase db = FirebaseDatabase.instance;
  //   DataSnapshot snapshot =
  //       await db.ref("cobaej_talpa/area1/sensor1/humedad/").get();

  //   // Imprimir el valor del documento
  //   return snapshot.value.toString();
  // }
}
