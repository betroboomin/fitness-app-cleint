import 'package:fitness2/view/weight.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/circlegender.gloabl.dart';
import 'package:fitness2/view/widgets/courosel.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/heigthpicker.global.dart';
import 'package:fitness2/view/widgets/sc.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeightView extends StatelessWidget {
  const HeightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back),
                      Text(
                        'load',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('1/8')
                    ],
                  ),
                  SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose your Height",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "It will help us tailor your workout plan according to you physiology",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // const WheelList(
                  //   itemCount: 100, // generate a list of 100 items
                  //   itemExtent: 100,
                  // ),
                  MyHeightPicker(),
                  const SizedBox(height: 50),
                 
                ],
              )),
        ),
      ),
      bottomNavigationBar: FooterBtnGlobal(
        text1: "Next",
        text2: "I'll do it latter",
        onTap1: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeightView(),
            ),
          );
        },
        onTap2: () {},
      ),
    );
  }
}
