import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class CarouselsSlider extends StatefulWidget {
  const CarouselsSlider({Key? key}) : super(key: key);
  @override
  State<CarouselsSlider> createState() => _CarouselsSliderState();
}

class _CarouselsSliderState extends State<CarouselsSlider> {
  int _currentIndex = 0;

  List<int> list = [1, 2, 3];

  List<String> cardList = [
    'images/carousel1.jpg',
    'images/carousel2.jpg',
    'images/carousel3.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          items: cardList.map((item) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Image.asset(item),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(list, (index, url) {
            return Container(
              width: 8,
              height: 8,
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    _currentIndex == index ? orange : orange.withOpacity(0.3),
              ),
            );
          }),
        )
      ],
    );
  }
}
