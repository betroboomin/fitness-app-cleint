import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../intro.view.dart';
import '../signin.view.dart';

class ButtonGlobal extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonGlobal(
      {super.key, required this.text,  required this.onTap});

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
            color: GlobalColors.mainColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15)
            ]),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
