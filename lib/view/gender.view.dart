import 'package:fitness2/view/height.view.dart';
import 'package:fitness2/view/signin.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/circlegender.gloabl.dart';
import 'package:fitness2/view/widgets/courosel.global.dart';
import 'package:fitness2/view/widgets/imageGender.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose your gender",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        
                        fontSize: 35,
                      ),
                    ),
                  ),
                  const  SizedBox(height: 10),
                  const Text(
                    
                    "It will help us tailor your workout plan according to you physiology",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                       ImageGender(text: 'Male', imagePath: 'assets/images/malevector.png',),
                        ImageGender(text: 'Female', imagePath: 'assets/images/femalevector.png',),
                      ],
                    ),
                  
                 
                  SizedBox(height: 140),
                  WhiteButtonGlobal(text: 'Next', onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeightView(),
                    ),
                  );
                  },),
                  SizedBox(height: 15),
                  WhiteButtonGlobal(text: "I'll do it latter", onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignView(),
                    ),
                  );
                  },),
                ],
              )),
        ),
      ),
    );
  }
}
