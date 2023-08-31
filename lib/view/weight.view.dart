import 'package:fitness2/view/goals.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/sc2.global.dart';
import 'package:fitness2/view/widgets/weightpicker.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';

class WeightView extends StatelessWidget {
  const WeightView({super.key});

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
                  const SizedBox(height: 10),
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
                      Text('2/8')
                    ],
                  ),
                  SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose your Weight",
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
                      "You will alwats be able to change it later",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // const WheelListHorizontal(
                  //   itemCount: 100, // generate a list of 100 items
                  //   itemExtent: 100,
                  // ),
                  MyWeightPicker(),
                  const SizedBox(height: 10),
                 
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
              builder: (context) => GoalView(),
            ),
          );
        },
        onTap2: () {},
      ),
    );
  }
}
