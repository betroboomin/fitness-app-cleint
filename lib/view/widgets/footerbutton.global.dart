import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';

import 'button.global.dart';

class FooterBtnGlobal extends StatelessWidget {
  const FooterBtnGlobal({super.key, required this.onTap1, required this.text1, required this.onTap2, required this.text2});
  final VoidCallback onTap1;
  final String text1;
  final VoidCallback onTap2;
  final String text2;


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      child: Container(
        height: 130.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              WhiteButtonGlobal(
                text:text1,
                onTap: onTap1
              ),
              ButtonGlobal(
                text: text2,
                onTap: onTap2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
