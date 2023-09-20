import 'package:flutter/material.dart';
import 'package:irrigation/widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fondos.png'),
                fit: BoxFit.cover)
                ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: Buttons(
          buttonText: 'Iniciar Sesion', 
          onPressed: (){}, 
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),)
      ),
      Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              children: [
                Image.asset('assets/images/logo blanco.png', width: 230),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 35),
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: const Align(
                  alignment: Alignment.center,
                    child: DefaultTextStyle(
                      style: TextStyle(fontFamily: 'Chroma', color: Colors.white, fontSize: 40),
                      child: Text('IRRIGATION', textAlign: TextAlign.center, )
                        ),
                      ),
                ),
              ],
            ),
        ],
      )
      ]    
    );
  }
}

