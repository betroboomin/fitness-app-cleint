import 'package:fitness2/view/ready.view.dart';
import 'package:fitness2/view/widgets/activity.global.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/dateCircle.global.dart';
import 'package:fitness2/view/widgets/footer.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/heigthpicker.global.dart';
import 'package:fitness2/view/widgets/timepicker.global.dart';
import 'package:fitness2/view/widgets/toggleButton.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';

class TrainTimeView extends StatelessWidget {
  const TrainTimeView({super.key});

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
                        Text('8/8')
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "When do you want to train?",
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
                        "Make your own schedule. Don't worry, you can always change it after",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DateCircleGlobal(text: "Mon"),
                            const DateCircleGlobal(text: "Tue"),
                            const DateCircleGlobal(text: "Wed"),
                            const DateCircleGlobal(text: "Thu"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DateCircleGlobal(text: "Fri"),
                            const DateCircleGlobal(text: "Sat"),
                            const DateCircleGlobal(text: "Sun"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    MyTimePicker(),
                    SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Text(
                                "send me notifications about \n upcoming trainings"),
                          ),
                          MyToggleButtons(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        bottomNavigationBar: FooterBtnGlobal(
          text1: "Next",
          text2: "I'll do it latter",
          onTap1: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ReadyView()));
          },
          onTap2: () {},
        ),
      ),
    );
  }
}
