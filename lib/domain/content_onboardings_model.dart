class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Solucion sencilla y eficaz',
      image: 'assets/images/onboarding_1.svg',
      discription: "Plantas siempre sanas y felices"),
  UnbordingContent(
      title: 'Nuestra app',
      image: 'assets/images/onboarding_2.svg',
      discription: "Tiene como objetivo "
                   "ayudar a ahorar agua y energia"),
  UnbordingContent(
      title: 'Utilizamos',
      image: 'assets/images/onboarding_3.svg',
      discription: "Sensores para detectar humedad y agustar el riego de forma automatica"),
];
