import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irrigation/View/infracstucture/Screens/home.dart';
import 'package:irrigation/View/widgets/buttons.dart';
import 'package:irrigation/features/auth/firebase_auth.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  bool obscureText = true;

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Error de aunthentificacion',
            style: TextStyle(fontFamily: 'Chroma', color: Colors.black)),
        content: const Text('Email y/o contraseña incorrecta',
            style: TextStyle(fontFamily: 'Chroma', fontSize: 12)),
        actions: [
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: Color.fromRGBO(3, 159, 0, 100)),
              onPressed: () => Navigator.pop(context),
              child: const Text('Reintentar',
                  style: TextStyle(
                      fontFamily: 'Chroma', fontSize: 12, color: Colors.white)))
        ],
      ),
    );
  }

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
                            style:
                                TextStyle(fontFamily: 'Chroma', fontSize: 22)),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            controller: _emailController,
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
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
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
                            onPressed: () => singIn(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10)),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Necesitas ayuda? Contactanos',
                              style: TextStyle(color: Colors.black),
                            ))
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

  void singIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen()));
    } else {
      openDialog(context);
    }
  }
}
