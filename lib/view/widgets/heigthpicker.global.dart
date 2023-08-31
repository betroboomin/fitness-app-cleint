import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHeightPicker extends StatefulWidget {
  @override
  _MyHeightPickerState createState() => _MyHeightPickerState();
}

class _MyHeightPickerState extends State<MyHeightPicker> {
  int _selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected height: $_selectedHeight cm',
        ),
        SizedBox(height: 20),
        Container(
          height: 400,
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: _selectedHeight - 100),
            itemExtent: 32,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedHeight = index + 100;
              });
            },
            children: List<Widget>.generate(121, (int index) {
              return Center(
                child: Text('${index + 100} cm'),
              );
            }),
          ),
        ),
      ],
    );
  }
}