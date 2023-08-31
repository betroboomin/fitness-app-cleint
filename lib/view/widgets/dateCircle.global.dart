import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';

class DateCircleGlobal extends StatelessWidget {
  const DateCircleGlobal({super.key, required this.text,});
  final String text;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(style: BorderStyle.solid, width: 2, color: GlobalColors.mainColor),
        
    color: Colors.transparent,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color:GlobalColors.mainColor,
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
