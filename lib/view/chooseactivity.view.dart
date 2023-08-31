import 'package:fitness2/view/traintime.view.dart';
import 'package:fitness2/view/widgets/activity.global.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/footer.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseActivityView extends StatelessWidget {
  const ChooseActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // backgroundColor: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
                        Text('6/8')
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Choose activities you like the most",
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
                        "We will recommend you workouts with this activities",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const ActivityGlobal(text: "cardio", height: 70, width: 1),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0, bottom: 10),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              ActivityGlobal(
                                  text: "Stretching", height: 70, width: 0.45),
                                  SizedBox(height: 15),
                              ActivityGlobal(
                                  text: "Weigth\nTraining", height: 155, width: 0.45),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:const  [
                               ActivityGlobal(
                                  text: "Yoga", height: 70, width: 0.45),
                                   SizedBox(height: 15),
                              ActivityGlobal(
                                  text: "HIIT", height: 70, width: 0.45),
                                   SizedBox(height: 15),
                              ActivityGlobal(
                                  text: "Pilate", height: 70, width: 0.45),
                            ],
                          )
                        ],
                      ),
                    ),
                    const ActivityGlobal(text: "cardio", height: 70, width: 90),
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
                                  builder: (context) => TrainTimeView()),
                            );
          },
          onTap2: () {},
        ),
      ),
    );
  }
}
