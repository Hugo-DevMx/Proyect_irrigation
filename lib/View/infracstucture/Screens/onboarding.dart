import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irrigation/Model/domain/content_onboardings_model.dart';
import 'package:irrigation/View/infracstucture/Screens/singin.dart';
import 'package:irrigation/View/widgets/buttons.dart';

class Oboarding extends StatefulWidget {
  const Oboarding({super.key});

  @override
  State<Oboarding> createState() => _OboardingState();
}

class _OboardingState extends State<Oboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/fondoSingin.jpeg"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage1.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            contents[i].image,
                            height: 200,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].title,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Chroma'),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'Chroma'),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildDot(index, context)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Buttons(
                buttonText:
                    currentIndex == contents.length - 1 ? 'Singin' : 'Next',
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SinginScreen()));
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
    );
  }
}
