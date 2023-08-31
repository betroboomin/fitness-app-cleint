import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CourosalGlobal extends StatelessWidget {
  const CourosalGlobal({super.key});

  @override
  Widget build(BuildContext context) {
     final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    return CarouselSlider(
                    items: items.map((item) {
                      return Container(
                        color: Colors.blue,
                        child:Center(
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  );
  }
}