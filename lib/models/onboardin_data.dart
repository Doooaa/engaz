class OnBoarding {
  String title;
  String description;
  String image;
  OnBoarding(
      {required this.title, required this.description, required this.image});

  static List<OnBoarding> getOnBoarding = [
    OnBoarding(
      title: ' مرحبا بك في انجز',
      description:
          "استمتع بتجربة فريدة وموثوقة لخدمات الصيانة المنزلية",
      image: 'assets/images/onBoarding/on1.json',
    ),
    OnBoarding(
      title: "متنوعة ومتخصصة",
      description:
          "استكشف مجموعة متنوعة من خدمات الصيانة المنزلية، من تركيب الهوائيات إلى صيانة الأجهزة الإلكترونية.",
      image: 'assets/images/onBoarding/on2.json',
    ),
    OnBoarding(
      title:  "حجز سهل وسريع",
      description:
         "احجز خدمتك المفضلة بسهولة واختر الوقت الذي يناسبك.",
      image: 'assets/images/onBoarding/on3.json',
    ),
    OnBoarding(
      title: "وفر وانجز وقتك مع انجز",
      description:
         "نحن نسعى لتقديم خدمات عالية الجودة لضمان رضاكم وراحتكم.",
      image: 'assets/images/onBoarding/on4.json',
    ),
  ];
}