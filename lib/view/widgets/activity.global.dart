import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';

class ActivityGlobal extends StatelessWidget {
  const ActivityGlobal({super.key, required this.text, required this.height, required this.width});
  final String text;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        
    color: GlobalColors.mainColor.withOpacity(0.3),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
