import 'package:fitness2/utils/global.colors.dart';
import 'package:fitness2/view/gender.view.dart';
import 'package:fitness2/view/height.view.dart';
import 'package:flutter/material.dart';

class WhiteButtonGlobal extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const WhiteButtonGlobal({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   print('Login');
      // },
      onTap: onTap,

      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: GlobalColors.buttonColor,
            borderRadius: BorderRadius.circular(6),
            // boxShadow: [
            //   BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15)
            // ]
            ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
