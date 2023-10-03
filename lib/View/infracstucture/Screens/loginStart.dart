import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irrigation/View/infracstucture/Screens/onboarding.dart';
import 'package:irrigation/View/widgets/buttons.dart';

class LoginStart extends StatelessWidget {
  const LoginStart({super.key});

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
          buttonText: 'Comenzemos', 
          onPressed: (){
            Navigator.push(
                          context, MaterialPageRoute(builder: (_) => const Oboarding()));
          }, 
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),)
      ),
      Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              children: [
                SvgPicture.asset('assets/images/logo.svg', width: 230),
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

