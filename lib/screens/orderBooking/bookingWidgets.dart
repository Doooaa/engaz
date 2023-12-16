import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage: true,
        autoPlay: true,
        // aspectRatio: 16/9,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,

        enableInfiniteScroll: true,

        viewportFraction: 0.8,
      ),
      items: MyOffersList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(children: [
              Center(
                child: Container(
                    height: 180,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(i),
                          fit: BoxFit.cover),
                    )),
              ),
            ]);
          },
        );
      }).toList(),
    );
  }
}

List<String> MyOffersList = [
  'assets/images/discount5.jpg',
   'assets/images/discount3.png',
  'assets/images/discount4.jpg',
  // 'assets/images/groube.jpg',
];
