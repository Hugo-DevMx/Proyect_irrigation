import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PowerSensor extends StatefulWidget {
  const PowerSensor({
    super.key,
  });

  @override
  State<PowerSensor> createState() => _PowerSensorState();
}

class _PowerSensorState extends State<PowerSensor> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  updFalse() async {
    DatabaseReference ref1 =
    FirebaseDatabase.instance.ref("cobaej_talpa/area1/");
    await ref1.update({
      "bomba1": true,
    });
  }

  updTrue() async {
    DatabaseReference ref1 =
    FirebaseDatabase.instance.ref("cobaej_talpa/area1/");
    await ref1.update({
      "bomba1": false,
    });
  }

  Color? _colorButton;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if(!isPressed){
        _colorButton = Colors.red;
      }else{
        _colorButton = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 100,
            height: 100,
            color: const Color.fromARGB(82, 255, 255, 255),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    width: 80,
                    height: 80,
                    color: const Color.fromRGBO(42, 57, 57, 100),
                    child: IconButton(
                        onPressed: () async {
                          if (!isPressed) {
                            updTrue();
                            isPressed = true;
                          } else {
                            updFalse();
                            isPressed = false;
                          }
                          _colorButton = isPressed ? Colors.red : Colors.green;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.power_settings_new_rounded,
                          size: 60,
                          color: _colorButton,
                        ))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
