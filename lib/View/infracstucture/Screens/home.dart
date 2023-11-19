import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irrigation/View/infracstucture/Screens/singin.dart';
import 'package:irrigation/View/widgets/cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void openDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Estas seguro?', 
      style: TextStyle(fontFamily: 'Chroma', color: Colors.black)),
      content: const Text('Es mejor si te quedas aqui, no te vallas!!', 
      style: TextStyle(fontFamily: 'Chroma', fontSize: 12)),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(
              fontFamily: 'Chroma', 
              fontSize: 12, 
              color: Color.fromRGBO(3, 159, 0, 100)))),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromRGBO(3, 159, 0, 100)
          ),
          onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SinginScreen())),
            child: const Text('Aceptar', 
            style: TextStyle(
              fontFamily: 'Chroma', 
              fontSize: 12,
              color: Colors.white)
              )
              )
      ],
    ),
  );
}
class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final hasNocht = MediaQuery.of(context).viewPadding.top > 35;
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: NavigationDrawer(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, hasNocht ? 10 : 20, 16, 0),
              child: const Text(
                "Institucion",
                style: TextStyle(fontFamily: 'Chroma', fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 40),
              child: Divider(
                thickness: 3,
                color: Color.fromARGB(255, 8, 75, 51),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'))),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              iconColor: const Color.fromRGBO(3, 159, 0, 100),
              title: const Text(
                'Ayuda y Soporte',
                style: TextStyle(fontFamily: 'Chroma', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                iconColor: const Color.fromRGBO(3, 159, 0, 100),
                title: const Text('Cerrar Sesion',
                    style: TextStyle(
                      fontFamily: 'Chroma',
                      color: Colors.black,
                    )),
                onTap: () {
                  openDialog(context);
                }),
            const SizedBox(height: 400),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'IRRIGATION',
                        style: TextStyle(fontFamily: 'Chroma', fontSize: 20),
                      ),
                      Text(
                        'from MACH',
                        style: TextStyle(fontFamily: 'Chroma'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color.fromARGB(255, 8, 75, 51)),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    icon: SvgPicture.asset('assets/icons/menu.svg'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Irrigation',
                      style: TextStyle(
                          fontFamily: 'Chroma',
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: const Text(
                    'MIS AREAS',
                    style: TextStyle(fontFamily: 'Chroma', fontSize: 36),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Container(
            child: const Expanded(
              child: CardAreasHome(),
              
            ),
          ),
        ]),
      ),
    );
  }
}
