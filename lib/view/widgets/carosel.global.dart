import 'package:flutter/material.dart';
import 'dart:async';

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _images = [
    'assets/images/background.jpg',
    'assets/images/coverfitness.jpg',
    'assets/images/fitness.jpeg',
  ];

  final List<String> _imageTexts = [
    'Ambitious',
    'Dedication',
    'Hard Work',
    'Sweat',
  ];
Timer? _timer;
  @override
  void initState() {
    super.initState();
     _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
       if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }
   @override
  void dispose() {
    _timer?.cancel(); // Cancel the Timer when the widget is disposed
    _controller.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: _controller,
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  _imageTexts[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}