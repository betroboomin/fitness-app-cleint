import 'package:fitness2/view/gender.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left:15.0, right: 15, top:300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                 const Align(
                    alignment: Alignment.center,
                    
                    child: Text(
                      "let's get to know each other!",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Text(
                    "Answer soe questions and we will tailor your own training and activity plan",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: HexColor('#2f3e46'),
                      fontSize: 16,
                    ),
                  ),
                const  SizedBox(height: 225),
                WhiteButtonGlobal(text: 'start', onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenderView(),
                    ),
                  );
                }, ),
                const  SizedBox(height: 10),
                ButtonGlobal(text: 'skip', onTap: (){},),
                ],
              )),
        ),
      ),
    );
  }
}


// body: Stack(
//         child: SafeArea(
//         children: const <Widget>[
//           Align(
//             alignment: Alignment.center,
//             child: Text(
//                       "let's get to know each other!",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 40,
//                       ),

//                     ),
//           ),

         
//            SizedBox(height: 90),
//             ButtonGlobal(text: 'start', navigateToPage: true),
//             SizedBox(height: 10),
//             ButtonGlobal(text: 'skip', navigateToPage: true),
//         ],
//         ),

//         // children: const [
//         //   Container(
//         //             child:  Text(
//         //               "let's get to know each other!",
//         //               style: TextStyle(
//         //                 fontWeight: FontWeight.w700,
//         //                 fontSize: 40,
//         //               ),

//         //             ),
//         //           ),
//         // ],
//       ),
//       // const SizedBox(height: 90),
//       //       const ButtonGlobal(text: 'start', navigateToPage: true),
//       //       const SizedBox(height: 10),
//       //       const ButtonGlobal(text: 'skip', navigateToPage: true),
//       // const SizedBox(height: 30),
//       // Container(
//       //   alignment: Alignment.center,
//       //   child: const Text(
//       //     "Answer soe questions and we will tailor your own training and activity plan",
//       //     style: TextStyle(
//       //       fontWeight: FontWeight.w400,
//       //       fontSize: 16,

//       //     ),
//       //   ),
//       // ),
//       // const SizedBox(height: 90),
//       // const ButtonGlobal(text: 'start', navigateToPage: true),

//       // const SizedBox(height: 10),
//       // const ButtonGlobal(text: 'skip', navigateToPage: true),
