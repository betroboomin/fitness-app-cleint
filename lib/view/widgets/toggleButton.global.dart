import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyToggleButtons extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MyToggleButtons> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeTrackColor: Colors.blue,
      activeColor: HexColor('#1E319D'),
    );
  }
}