import 'package:flutter/material.dart';

class DownButton extends StatefulWidget {
  const DownButton({super.key});

  @override
  State<DownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
  _DownButtonState() {
    _dropdownvalueHours = listHours[0];
    _dropdownvalueLaps = listLaps[1];
  }

  String? _dropdownvalueHours = '';
  String? _dropdownvalueLaps = '';
  final listHours = [
    '1:00 am',
    '2:00 am',
    '3:00 am',
    '4:00 am',
    '5:00 am',
    '6:00 am',
    '7:00 am',
    '8:00 am',
    '9:00 am',
    '10:00 am',
    '11:00 am',
    '12:00 pm',
    '1:00 pm',
    '2:00 pm',
    '3:00 pm',
    '4:00 pm',
    '5:00 pm',
    '6:00 pm',
    '7:00 pm',
    '8:00 pm',
    '9:00 pm',
    '10:00 pm',
    '11:00 pm',
    '0:00 am'
  ];
  final listLaps = [
    '5 min',
    '10 min',
    '15 min',
    '20 min',
    '25 min',
    '30 min',
    '35 min',
    '40 min',
    '45 min',
    '50 min',
    '55 min',
    '1 hora'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                'Hora',
                style: TextStyle(fontFamily: 'Chroma', color: Colors.white),
              ),
              DropdownButton(
                value: _dropdownvalueHours,
                icon: const Icon(Icons.keyboard_arrow_down),
                focusColor: Colors.white,
                elevation: 5,
                iconEnabledColor: Colors.white,
                iconSize: 28,
                dropdownColor: Colors.white,
                underline: Container(
                  height: 1,
                  color: Colors.white,
                ),
                items: listHours.map((hour) {
                  return DropdownMenuItem(
                    value: hour,
                    child: Text(hour, style: const TextStyle(fontFamily: 'Chroma', fontWeight: FontWeight.bold),),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _dropdownvalueHours = value;
                  });
                },
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Text('Lapso',
                  style: TextStyle(fontFamily: 'Chroma', color: Colors.white)),
              DropdownButton(
                value: _dropdownvalueLaps,
                elevation: 5,
                iconEnabledColor: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 28,
                underline: Container(
                  height: 1,
                  color: Colors.white,
                ),
                items: listLaps.map((laps) {
                  return DropdownMenuItem(
                    value: laps,
                    child: Text(laps, style: const TextStyle(fontFamily: 'Chroma', fontWeight: FontWeight.bold)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _dropdownvalueLaps = value;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
