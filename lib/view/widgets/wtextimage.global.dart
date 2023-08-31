import 'package:flutter/material.dart';

class PackageGlobal extends StatelessWidget {
  const PackageGlobal({Key? key, required this.text, required this.text2, required this.numb})
      : super(key: key);
  final String text;
  final String text2;
  final double numb;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width * numb,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(40, 158, 158, 158),
              spreadRadius: 2,
              blurRadius: 7,
              // offset: Offset(0, 3),
            )
          ],
          image: DecorationImage(
            image: NetworkImage(text),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(
                          0.9), // Black color at the bottom with 80% opacity
                      Colors.black
                          .withOpacity(0.2), // Transparent color at the top
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     '7X4 CHALLENGE',
                  //     style: const TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
