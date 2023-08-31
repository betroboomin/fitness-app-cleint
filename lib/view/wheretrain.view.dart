import 'package:fitness2/view/chooseactivity.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/cirles.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/sc2.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';

class WhereTrainView extends StatelessWidget {
  const WhereTrainView({super.key});

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
                      Text('5/8')
                    ],
                  ),
                 const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Where do you prefer to Train",
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
                      "Based on your answer, we will offer you different workouts",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Circles(
                              text: "home",
                              picturestring: 'assets/images/homeicon.svg'),
                          SizedBox(height: 20),
                          Circles(
                              text: "gym",
                              picturestring: 'assets/images/gymicon.png'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  
                ],
              )),
        ),
      ),
      bottomNavigationBar: FooterBtnGlobal(
          text1: "Next",
          text2: "I'll do it latter",
          onTap1: () {
            // Navigator.push(context, route)
             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseActivityView()),
                            );
          },
          onTap2: () {},
        ),
    );
  }
}
