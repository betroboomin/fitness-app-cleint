import 'package:fitness2/view/dashboard.view.dart';
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

class ReadyView extends StatelessWidget {
  const ReadyView({super.key});

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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "You are ready to Start!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          fontSize: 50,
                        ),
                      ),
                    ),
                     const SizedBox(
                      height: 40
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Your personal plan is ready. We are always here to help you reach your goals",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                     const SizedBox(
                      height: 40
                    ),
                    ButtonGlobal(
                        text: "Start Now",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardView()));
                        })
                  ],
                )),
          ),
        ),
       
      ),
    );
  }
}
