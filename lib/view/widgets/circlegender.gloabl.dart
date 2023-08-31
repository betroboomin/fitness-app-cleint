import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleGender extends StatefulWidget {
  const CircleGender({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _CircleGenderState createState() => _CircleGenderState();
}

class _CircleGenderState extends State<CircleGender> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(150, 0, 0, 0).withOpacity(0.1),
              blurRadius: 15,
            ),
          ],
          color: _isSelected ? GlobalColors.mainColor: Colors.white, // change color to blue when _isSelected is true
          border: Border.all(width: 3, color: _isSelected ? HexColor('#ffffff'):HexColor('#03045e')),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 30,
              color: _isSelected ? Colors.white : HexColor('#03045e'),
              fontWeight: FontWeight.w700,
              
            ),
          ),
        ),
      ),
    );
  }
}