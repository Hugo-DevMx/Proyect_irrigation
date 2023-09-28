import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irrigation/infracstucture/Screens/home.dart';
import 'package:irrigation/widgets/buttons.dart';

class SinginScreen extends StatefulWidget {

    const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fondoSingin.jpeg'),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 230,
              ),
              const SizedBox(height: 100),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 350,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const Text('Bienvenido a Irrigation',
                            style: TextStyle(fontFamily: 'Chroma', fontSize: 22)),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'E-mail',
                                ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off, color: Colors.black,),
                                  onPressed: () {
                                    setState(() {
                                       obscureText = !obscureText;
                                    });
                                  },
                                ),
                              ),
                              obscureText: obscureText,
                            )),
                        const SizedBox(height: 60),
                        Buttons(
                            buttonText: 'Inciar Sesion',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => const HomeScreen()));
                            },
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10)),
                         const SizedBox(height: 10),
                        const Text('Necesitas Ayuda? Contactanos')
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
