import 'package:fitness2/view/chooseTraining.view.dart';
import 'package:fitness2/view/weight.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/circlegender.gloabl.dart';
import 'package:fitness2/view/widgets/courosel.global.dart';
import 'package:fitness2/view/widgets/sc.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});

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
                      Text('3/8')
                    ],
                  ),
                  SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "What are your goals?",
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
                      "seeing your progress is the best motivation",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "You can choose more than one goal.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleGender(text: "Get Fit"),
                      SizedBox(width: 20),
                      CircleGender(text: "Lose\nweight"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleGender(text: "Build\nmuscle"),
                      SizedBox(width: 20),
                      CircleGender(text: "Gain\nWeight"),
                    ],
                  ),
                  const SizedBox(height: 50),
                  WhiteButtonGlobal(
                    text: 'Next',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseTrainingView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  ButtonGlobal(
                    text: "I'll do it latter",
                   onTap: () {
                     
                   },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
